// C wrapper code
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LENGTH 100
extern char* EncryptVigenere(const char *plaintext, const char *key);


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
