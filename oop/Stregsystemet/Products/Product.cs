class Product
{
    int _id;

    [Name("id")]
    public int ID
    {
        get { return _id; }
        set
        {
            if (_id < 1) new ArgumentException("ID cannot be less than 1.");
            _id = value;
        }
    }

    string _name = "";

    [Name("name")]
    public string Name
    {
        get
        {
            return _name;
        }
        set
        {
            _name = ProductNameParser.Parse(value);
        }
    }

    [Name("price")]
    public decimal Price { get; set; }

    [Name("active")]
    public bool Active { get; set; }

    [Name("deactivate_date")]
    public string DeactiveDate { get; set; } = "";

    public bool CanBeBoughtOnCredit { get; set; } = false;
    public override string ToString() => $"{ID} {Name} {Price}";

    public Product() { }

    public Product(int id, string name, decimal price, bool active, bool canBeBoughtOnCredit)
    {
        ID = id;
        Name = name;
        Price = price;
        Active = active;
        CanBeBoughtOnCredit = canBeBoughtOnCredit;
    }
}