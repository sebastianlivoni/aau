class BuyTransaction : ITransaction
{
  public Guid ID { get; set; } = new();

  public DateTime Date { get; set; }
  public decimal Amount { get; set; }
  public User User { get; set; }
  public Product Product;

  public override string ToString() => $"{User} bought item: {Product} on {Date} for {Amount}";

  public void Execute()
  {
    if (User.Balance - Amount < 0 && Product.CanBeBoughtOnCredit is not true)
    {
      throw new InsufficientCreditsException();
    }
    User.Withdraw(Amount);
    Date = DateTime.Now;
    Logger.LogInformation(this.ToString());
  }

  public BuyTransaction(User user, Product product)
  {
    User = user;
    Product = product;
    Amount = product.Price;
  }

}