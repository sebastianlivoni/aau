public class User : IComparable<User>
{
  [Name("id")]
  public int ID { get; set; }
  [Name("firstname")]
  public string Firstname { get; set; } = "";
  [Name("lastname")]
  public string Lastname { get; set; } = "";
  string _username = "";
  string _email = "";
  decimal _balance;
  [Name("username")]
  public string Username
  {
    get { return _username; }
    set
    {
      if (new UsernameValidation().isValid(value) is not true)
        throw new ArgumentException("Username must only include: [0-9], [a-z], og '_'");

      _username = value;
    }
  }
  [Name("email")]
  public string Email
  {
    get { return _email; }
    set
    {
      if (new EmailAddressValidation().isValid(value) is not true)
        throw new ArgumentException("Email is not valid.");

      _email = value;
    }
  }
  [Name("balance")]
  public decimal Balance
  {
    get { return _balance; }
    set
    {
      _balance = value;
    }
  }

  public User() { }

  public User(int id, string firstname, string lastname, string username, string email, decimal balance)
  {
    ID = id;
    Firstname = firstname;
    Lastname = lastname;
    Username = username;
    Email = email;
    Balance = balance;
  }

  public void Deposit(decimal amount)
  {
    Balance += amount;
  }

  public void Withdraw(decimal amount)
  {
    Balance -= amount;
  }

  public override string ToString() => $"{Firstname} {Lastname} {Username}";

  public bool Equals(User user)
  {
    return user.GetHashCode() == this.GetHashCode();
  }

  public override int GetHashCode()
  {
    return Username.GetHashCode() * 17 + Firstname.GetHashCode() + Lastname.GetHashCode() + Email.GetHashCode();
  }

  public int CompareTo(User? user)
  {
    return this.ID.CompareTo(user?.ID);
  }

  public delegate void UserBalanceNotification(User user, decimal balance);
}