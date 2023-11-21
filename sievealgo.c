#include <stdio.h>

int main()
{
    int number,i,j;
    printf("Enter the number\n");
    if (scanf("%d", &number) == 1) {
        int primes[number+1];

        //populating array with naturals numbers
        for(i = 2; i<=number; i++)
            primes[i] = i;

        i = 2;
        while ((i*i) <= number)
        {
            if (primes[i] != 0)
            {
                for(j=2; j<number; j++)
                {
                    if (primes[i]*j > number)
                        break;
                    else
                        // Instead of deleteing , making elements 0
                        primes[primes[i]*j]=0;
                }
            }
            i++;
        }

        printf("[");
        for(i = 2; i<=number; i++)
        {
            //If number is not 0 then it is prime
            if (primes[i]!=0)
                printf("%d,",primes[i]);
        }
        printf("]\n");
        
    } else {
        printf("Invalid input. Please enter a valid number.\n");
    }

    

    return 0;
}