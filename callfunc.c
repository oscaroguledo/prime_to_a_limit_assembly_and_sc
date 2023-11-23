#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <assert.h>

// Declaration of the external assembly function
extern int64_t getarray(const int64_t limit, const int64_t index);

void generator(int16_t limit, int16_t *primes){
    
    int16_t i =0; // Start from the number 2 (first prime since 1 and 0 are not primes)
    int16_t *genprime;
    // Dynamically allocate memory for the array
    genprime = (int16_t *)malloc(limit * sizeof(int16_t));


    // Prompting user to set the limit
    printf("Using the limit as %d to generate the array \n", limit);

    printf("array of prime numbers from 0 to %d = \n [",limit); // Print start of array representation
    
    // Loop through the numbers up to the limit
    int j=0;
    while (i <= limit) {
        // Call the external assembly function to get the value for the current index
        int64_t ga = getarray(limit, i);

        // Check if the returned value from assembly is greater than or equal to 2 (considered as prime)
        if (ga != 0) {
            printf("%ld,", ga); // Print the prime number followed by a comma
            genprime[j]=ga;
            ++j;
        }

        ++i; // Move to the next number
    }

    printf("]\n"); // Print end of array representation

    printf("Testing ...\n"); 
    for(int i=0; i<=j;++i){
        if (primes[i] != genprime[i]) {
            printf("Arrays differ at index %d: primes[%d] = %d, genprime[%d] = %d\n", i, i, primes[i], i, genprime[i]);
        }
    }
    printf("Testing Complete \n\n"); 
}

int main() {
    //Testing 
    int16_t limits[4] ={40,20,59,76};
    for (int64_t i =1 ;i < 4;++i ){
        if (limits[i] == 40){
            int16_t primes[] = {2,3,5,7,11,13,17,19,23,29,31,37}; // Known primes for comparison
            generator(limits[i],primes);
        }
        if (limits[i] == 20){
            int16_t primes[] = {2,3,5,7,11,13,17,19}; // Known primes for comparison
            generator(limits[i],primes);
        }
        if (limits[i] == 59){
            int16_t primes[] = {2,3,5,7,11,13,17,19,23,29,31,37, 41, 43, 47, 53, 59}; // Known primes for comparison
            generator(limits[i],primes);
        }
        if (limits[i] == 76){
            int16_t primes[] = {2,3,5,7,11,13,17,19,23,29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73}; // Known primes for comparison
            generator(limits[i],primes);
        }
    }

    return 0;
}
