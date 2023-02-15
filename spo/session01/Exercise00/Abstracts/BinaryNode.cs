namespace Exercise00;

public abstract class BinaryNode : Node
{
    Node _left;
    Node _right;
    
    public BinaryNode(Node left, Node right)
    {
        _left = left;
        _right = right;
    }

    public override void PrintInorder()
    {
        _left.PrintInorder();
        Print();
        _right.PrintInorder();
    }
    
    public override void PrintPreorder()
    {
        Print();
        _left.PrintPreorder();
        _right.PrintPreorder();
    }

    public override void PrintPostorder()
    {
        _left.PrintPostorder();
        _right.PrintPostorder();
        Print();
    }
}