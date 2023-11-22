#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>


extern int64_t getarray(const int64_t limit,const int64_t index);

int main()
{
    int64_t limit,i;
    printf("Set the limit\n");
    if (scanf("%ld", &limit) == 1) {
        printf("[");
        i=2;
        while (i <= limit ){
            int64_t ga = getarray(limit,i);
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