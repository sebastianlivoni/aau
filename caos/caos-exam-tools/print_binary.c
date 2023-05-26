void print_binary(int value, int BIT_WORD_SIZE)
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