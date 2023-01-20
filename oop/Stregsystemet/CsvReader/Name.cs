class Name : Attribute
{
    public string _name { get; set; }

    public Name(string name)
    {
        _name = name;
    }

    public string GetName()
    {
        return _name;
    }
}