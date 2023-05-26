#include <stdio.h>

void print_binary(int value, int size);

int main()
{
    print_binary(10, 6);
    printf("\n");

    return 1;
}

void print_binary(int value, int size)
{
    if (size == 0)
        return;

    print_binary(value / 2, --size);

    printf("%d", value % 2);
}