using System.Reflection;

class CsvReader
{
    public StreamReader Reader { get; set; }
    public Dictionary<int, string> Columns { get; set; } = new();
    public Dictionary<string, PropertyInfo> Properties { get; set; } = new();
    CsvReaderOptions _options { get; set; }

    public CsvReader(StreamReader reader, CsvReaderOptions options)
    {
        Reader = reader;
        _options = options;
        SetHeaders();
    }

    void SetHeaders()
    {
        string? line = Reader.ReadLine();
        if (line == null) throw new FileLoadException("Could not find headers in first line");
        string[] headers = line.Split(_options.Delimiter);
        int i = 0;
        foreach (string header in headers)
        {
            Columns.Add(i, header);
            i++;
        }
    }

    void SetProperties<T>()
    {
        PropertyInfo[] props = typeof(T).GetProperties();
        foreach (PropertyInfo prop in props)
        {
            object[] attrs = prop.GetCustomAttributes(true);
            foreach (object attr in attrs)
            {
                Name? csvattr = attr as Name;
                if (csvattr != null)
                {
                    string csv = csvattr.GetName();

                    Properties.Add(csv, prop);
                }
            }
        }
    }

    public List<T> GetRecords<T>() where T : new()
    {
        SetProperties<T>();

        List<T> list = new();
        string? line;
        while ((line = Reader.ReadLine()) != null)
        {
            string[] sequence = line.Split(_options.Delimiter);
            T p = CreateItem<T>(sequence);
            list.Add(p);
        }

        return list;
    }

    public T CreateItem<T>(string[] sequence) where T : new()
    {
        T t = new T();

        for (int i = 0; i < sequence.Length; i++)
        {
            PropertyInfo prop = Properties[Columns[i]];
            if (prop.PropertyType == typeof(bool)) prop.SetValue(t, Convert.ToBoolean(Convert.ToInt32(sequence[i])));
            else prop.SetValue(t, Convert.ChangeType(sequence[i], prop.PropertyType)); // https://stackoverflow.com/questions/1398796/casting-with-reflection
        }

        return t;
    }
}