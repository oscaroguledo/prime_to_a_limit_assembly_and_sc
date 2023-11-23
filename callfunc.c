#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

// Declaration of the external assembly function
extern int64_t getarray(const int64_t limit, const int64_t index);

int main() {
    int64_t limit, i;

    // Prompting user to set the limit
    printf("Set the limit\n");

    // Input validation for limit
    if (scanf("%ld", &limit) == 1) {
        printf("["); // Print start of array representation
        
        i = 2; // Start from the number 2 (first prime since 1 and 0 are not primes)

        // Loop through the numbers up to the limit
        while (i <= limit) {
            // Call the external assembly function to get the value for the current index
            int64_t ga = getarray(limit, i);

            // Check if the returned value from assembly is greater than or equal to 2 (considered as prime)
            if (ga >= 2) {
                printf("%ld,", ga); // Print the prime number followed by a comma
            }

            ++i; // Move to the next number
        }

        printf("]\n"); // Print end of array representation
    } else {
        printf("Invalid input. Please enter a valid number.\n"); // Error message for invalid input
    }

    return 0;
}
