#include <stdio.h>
#include <stdlib.h>

void printArray(long *ptr, int size);
void swap(long *a, long *b);

#define SIZE 20

int main()
{
    long *a = malloc(SIZE * sizeof(long));

    for (int i = 0; i < SIZE; i++)
    {
        a[i] = i + 10;
    }

    printArray(a, SIZE);

    long *ptr4th = &a[3];

    printf("%p\n", ptr4th);
    printf("%p\n", a);

    swap(&a[0], &a[5]);

    printArray(a, SIZE);

    long y = *(ptr4th + 9);
    printf("%lx\n", y);

    return 0;
}

void swap(long *a, long *b)
{
    long temp = *a;
    *a = *b;
    *b = temp;
}

void printArray(long *ptr, int size)
{
    int i = 0;
    while (i++ < size)
    {
        printf("%ld %lx\n", *ptr, *ptr);
        ptr++;
    }
}