namespace Exercise00;

public abstract class Node
{
    public abstract void PrintInorder();
    public abstract void PrintPreorder();
    public abstract void PrintPostorder();

    protected virtual void Print()
    {
        Console.WriteLine(this.GetType().Name);
    }
}