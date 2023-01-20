class InsertCashTransaction : ITransaction
{

  public Guid ID { get; set; } = new();

  public DateTime Date { get; set; }
  public decimal Amount { get; set; }
  public User User { get; set; }

  public override string ToString() => $"User: {User} deposited ${Amount} credits at {Date}";

  public void Execute()
  {
    User.Deposit(Amount);
    Date = DateTime.Now;
    Logger.LogInformation(this.ToString());
  }

  public InsertCashTransaction(User user, decimal amount)
  {
    User = user;
    Amount = amount;
  }

}