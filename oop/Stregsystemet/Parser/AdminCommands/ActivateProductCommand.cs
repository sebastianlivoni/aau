
class ActivateProductCommand : AdminCommand
{
  public ActivateProductCommand(IStregSystemUI ui, IStregSystem stregSystem, string[] args) : base(ui, stregSystem, args) { }

  public override void Execute()
  {
    Product product = _stregsystem.GetProductById(int.Parse(_args[0]));
    if (!(product is SeasonalProduct))
    {
      product.Active = true;
    }
  }
}