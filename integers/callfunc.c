#include <stdio.h>
#include <stdint.h>

// C prototype for the assembler function
extern int64_t get_array(int64_t n);

int main(int argc, char *argv[]) {
    int64_t number;
    // Call the assembler function and show the result
    printf("Enter a number: ");
    if (scanf("%ld", &number) == 1) {
        int64_t result = get_array(number);
        
        printf("Result is = %ld", result);
        
    } else {
        printf("Invalid input. Please enter a valid number.\n");
    }
    return 0;
}
