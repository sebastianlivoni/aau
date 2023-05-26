#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#define BIT_WORD_SIZE 14

typedef enum _type
{
    _unsigned,
    _signed
} _type;

void print_binary(int value);

int main()
{
    const int UINT_MIN = 0;
    const int UINT_MAX = pow(2, BIT_WORD_SIZE) - 1;

    const int INT_MIN = -pow(2, BIT_WORD_SIZE - 1);
    const int INT_MAX = pow(2, BIT_WORD_SIZE - 1) - 1;

    printf("UINT_MIN:\n  decimal: %d\n  binary: ", UINT_MIN);
    print_binary(UINT_MIN);
    printf("\n");

    printf("UINT_MAX:\n  decimal: %d\n  binary: ", UINT_MAX);
    print_binary(UINT_MAX);

    printf("\n");
    printf("INT_MIN:\n  decimal: %d\n  binary: ", INT_MIN);
    print_binary(INT_MIN);

    printf("\n");
    printf("INT_MAX:\n  decimal: %d\n  binary: ", INT_MAX);
    print_binary(INT_MAX);
    printf("\n");

    return 1;
}

void print_binary(int value)
{
    int i;
    int arr[BIT_WORD_SIZE];

    for (i = 0; i < BIT_WORD_SIZE; i++)
    {
        arr[i] = value % 2;
        value = abs(value / 2);
    }
    for (i = i - 1; i >= 0; i--)
    {
        printf("%d", arr[i]);
    }
}