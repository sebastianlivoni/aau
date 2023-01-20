
class UserBuysProductCommand : Command
{
  string _username;
  string _productNumber;

  public UserBuysProductCommand(IStregSystemUI ui, IStregSystem stregSystem, string username, string productNumber) : base(ui, stregSystem)
  {
    _username = username;
    _productNumber = productNumber;
  }

  public override void Execute()
  {
    User user = _stregsystem.GetUserByUsername(_username);
    Product product = _stregsystem.GetProductById(Int32.Parse(_productNumber));
    BuyTransaction transaction = _stregsystem.BuyProduct(user, product);
    _ui.DisplayUserBuysProduct(transaction);
  }
}