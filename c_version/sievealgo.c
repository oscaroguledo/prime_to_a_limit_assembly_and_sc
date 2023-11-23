#include <stdio.h>

int main() {
    int number, i, j;
    printf("Enter the number\n");

    // Input validation for number
    if (scanf("%d", &number) == 1) {
        int primes[number + 1]; // Array to store numbers

        // Populating the array with natural numbers from 2 to 'number'
        for (i = 2; i <= number; i++)
            primes[i] = i;

        i = 2;
        // Sieve of Eratosthenes algorithm to find primes
        while ((i * i) <= number) {
            if (primes[i] != 0) {
                for (j = 2; j < number; j++) {
                    // Mark multiples of prime numbers as 0 (not delete, but mark)
                    if (primes[i] * j > number)
                        break;
                    else
                        primes[primes[i] * j] = 0;
                }
            }
            i++;
        }

        printf("[");
        // Printing the prime numbers
        for (i = 2; i <= number; i++) {
            // If the number is not marked as 0, it is prime
            if (primes[i] != 0)
                printf("%d,", primes[i]);
        }
        printf("]\n");
        
    } else {
        printf("Invalid input. Please enter a valid number.\n"); // Error message for invalid input
    }

    return 0;
}
