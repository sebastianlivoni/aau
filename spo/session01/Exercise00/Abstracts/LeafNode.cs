namespace Exercise00;

public abstract class LeafNode : Node
{ 
    private readonly string _value; 
    
    public LeafNode(string value)
    {
        _value = value;
    }

    protected override void Print()
    {
        Console.WriteLine(_value);
    }

    public override void PrintInorder() => Console.WriteLine(_value);
    public override void PrintPreorder() => Console.WriteLine(_value);
    public override void PrintPostorder() => Console.WriteLine(_value);
}