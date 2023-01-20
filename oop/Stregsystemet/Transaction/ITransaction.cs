interface ITransaction
{
  public Guid ID { get; set; }
  DateTime Date { get; set; }
  public User User { get; set; }
  public decimal Amount { get; set; }

  public string ToString();
  public void Execute();
}