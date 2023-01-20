class CsvReaderOptions
{
    public string Delimiter { get; set; }

    public CsvReaderOptions(string delimiter)
    {
        Delimiter = delimiter;
    }
}