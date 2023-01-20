class SeasonalProduct : Product
{
  DateTime SeasonStartDate { get; set; }
  DateTime SeasonEndDate { get; set; }

  public SeasonalProduct(int id, string name, decimal price, bool active, bool canBeBoughtOnCredit, DateTime seasonStartDate, DateTime seasonEndDate) : base(id, name, price, active, canBeBoughtOnCredit)
  {
    SeasonStartDate = seasonStartDate;
    SeasonEndDate = seasonEndDate;
  }
}