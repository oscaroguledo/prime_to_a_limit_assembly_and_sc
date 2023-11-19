#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LENGTH 100

int isLetterInString(const char *str, char letter) {
    while (*str != '\0') {
        if (*str == letter) {
            return 1; // Letter found in the string
        }
        str++; // Move to the next character in the string
    }
    return 0; // Letter not found in the string
}

char toUpperCase(char letter) {
    if (letter >= 'a' && letter <= 'z') {
        // Calculate the uppercase equivalent by subtracting the ASCII difference
        return letter - ('a' - 'A');
    }
    return letter; // Return unchanged if it's not a lowercase letter
}
char toLowerCase(char letter) {
    if (letter >= 'A' && letter <= 'Z') {
        // Calculate the lowercase equivalent by adding the ASCII difference
        return letter + ('a' - 'A');
    }
    return letter; // Return unchanged if it's not an uppercase letter
}

char* EncryptVigenere(const char *plaintext, const char *key) {
    int textLength = strlen(plaintext);
    int keyLength = strlen(key);
    const char *lowerletters = "abcdefghijklmnopqrstuvwxyz";
    const char *upperletters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    char *ciphertext = (char *)malloc(textLength + 1); // Allocate memory for ciphertext (+1 for null terminator)
    if (ciphertext == NULL) {
        printf("Memory allocation failed.\n");
        return NULL;
    }

    int i=0, j=0;
    while (i < (textLength-1)) {
        if (j == (keyLength-1)) {
            j = 0; // Restart key from the beginning if it's shorter than the plaintext
        }

        // Apply the Vigenère cipher only to alphabetic characters
        if (isLetterInString(lowerletters, plaintext[i])) {
            char sk = key[j];
            int p26 = (plaintext[i]-'a')%26;
            int k26 = (toLowerCase(sk)-'a')%26;
            ciphertext[i] = ((p26+k26) % 26) + 'a';

        } else {
            if (isLetterInString(upperletters, plaintext[i])){
                char bk = key[j];
                int p26 = (plaintext[i]-'A')%26;
                int k26 = (toUpperCase(bk)-'A')%26;
                ciphertext[i] = ((p26+k26) % 26) + 'A';

            } else {
                ciphertext[i] = plaintext[i]; // Keep non-alphabetic characters unchanged
                
            }
        }
        ++i;
        ++j;// Adjust the key index for non-alphabetic characters
    }
    ciphertext[textLength] = '\0'; // Null-terminate the ciphertext
    return ciphertext;
}

int main() {
    char plaintext[MAX_LENGTH];
    char key[MAX_LENGTH];

    printf("Enter a plaintext: ");
    if (fgets(plaintext, sizeof(plaintext), stdin) != NULL) {
        printf("Enter a key: ");
        if (fgets(key, sizeof(key), stdin) != NULL) {
            char *enc = EncryptVigenere(plaintext, key);
            if (enc != NULL) {
                printf("CIPHERTEXT: %s\n", enc);
                free(enc);
            } else {
                printf("Encryption failed.\n");
            }
        } else {
            printf("Failed to read key.\n");
        }
    } else {
        printf("Failed to read plaintext.\n");
    }

    return 0;
}
