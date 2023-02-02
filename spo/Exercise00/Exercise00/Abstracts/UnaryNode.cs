namespace Exercise00;

public abstract class UnaryNode : Node
{
    private Node _child;
    
    public UnaryNode(Node child)
    {
        _child = child;
    }

    public override void PrintInorder()
    {
        _child.PrintInorder();
        Print();
    }

    public override void PrintPreorder()
    {
        Print();
        _child.PrintPreorder();
    }

    public override void PrintPostorder()
    {
        _child.PrintPostorder();
        Print();
    }
}