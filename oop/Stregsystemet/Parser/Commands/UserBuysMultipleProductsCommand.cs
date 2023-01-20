
class UserBuysMultipleProductsCommand : Command
{
  string _username;
  string _productNumber;
  string _count;

  public UserBuysMultipleProductsCommand(IStregSystemUI ui, IStregSystem stregSystem, string username, string productNumber, string count) : base(ui, stregSystem)
  {
    _username = username;
    _productNumber = productNumber;
    _count = count;
  }

  public override void Execute()
  {
    User user = _stregsystem.GetUserByUsername(_username);
    Product product = _stregsystem.GetProductById(Int32.Parse(_productNumber));

    List<BuyTransaction> transactions = _stregsystem.BuyProduct(user, product, Int32.Parse(_count));
    _ui.DisplayUserBuysProduct(Int32.Parse(_count), transactions.First());
  }
}