#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>


extern int64_t getarray(const int64_t number,const int64_t index);

int main()
{
    int64_t number,i;
    printf("Enter the number\n");
    if (scanf("%ld", &number) == 1) {
        printf("[");
        i=2;
        while (i <= number ){
            int64_t ga = getarray(number,i);
            if (ga >= 2) {
                printf("%ld,",ga);
            }
            ++i;
        }
        printf("]\n");
        
    } else {
        printf("Invalid input. Please enter a valid number.\n");
    }

    return 0;
}