#include <stdio.h>
#include <math.h>
#include <stdlib.h>

void print_value(char *type, int value);
void print_binary(int value, int size);

unsigned int word_size;

int main()
{
    printf("What is your word size (in bits)? ");
    scanf("%d", &word_size);

    const int UINT_MIN = 0;
    const int UINT_MAX = pow(2, word_size) - 1;

    const int INT_MIN = -pow(2, word_size - 1);
    const int INT_MAX = pow(2, word_size - 1) - 1;

    print_value("UINT_MIN", UINT_MIN);
    print_value("UINT_MAX", UINT_MAX);
    print_value("INT_MIN", INT_MIN);
    print_value("INT_MAX", INT_MAX);
    return 1;
}

void print_value(char *type, int value)
{
    printf("%s:\n  decimal: %d\n  binary: ", type, value);
    print_binary(value, word_size);
    printf("\n");
}

void print_binary(int value, int size)
{
    if (size == 0)
        return;

    print_binary(value / 2, --size);

    printf("%d", abs(value % 2));
}