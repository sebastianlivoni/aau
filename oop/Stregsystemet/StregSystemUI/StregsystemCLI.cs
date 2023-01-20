public delegate void StregSystemHandler(string command);

class StregsystemCLI : IStregSystemUI
{
  IStregSystem StregSystem { get; set; }
  bool Running = false;

  public StregsystemCLI(IStregSystem stregSystem)
  {
    StregSystem = stregSystem;
  }

  event StregSystemHandler IStregSystemUI.CommandEntered
  {
    add
    {
      CommandEntered += value;
    }

    remove
    {
      CommandEntered -= value;
    }
  }

  public void Close()
  {
    Console.WriteLine("Closing...");
    Running = false;
  }

  public void DisplayAdminCommandNotFoundMessage(string adminCommand)
  {
    Console.WriteLine("Command not found: " + adminCommand);
  }

  public void DisplayGeneralError(string errorString)
  {
    Console.WriteLine("Error: " + errorString);
  }

  public void DisplayInsufficientCash(User user, Product product)
  {
    Console.WriteLine($"User {user.Username} has insufficient funds to buy {product.Name}");
  }

  public void DisplayInsufficientCash(User user, Product product, int count)
  {
    Console.WriteLine($"User {user.Username} has insufficient funds to buy {count} x {product.Name}");
  }

  public void DisplayProductNotFound(string product)
  {
    Console.WriteLine("Product with id " + product + " not found: ");
  }

  public void DisplayTooManyArgumentsError(string command)
  {
    Console.WriteLine("Too many arguments for command: " + command);
  }

  public void DisplayUserBuysProduct(BuyTransaction transaction)
  {
    Console.WriteLine($"{transaction.User.Username} bought {transaction.Product.Name} for {transaction.Product.Price}");
  }

  public void DisplayUserBuysProduct(int count, BuyTransaction transaction)
  {
    Console.WriteLine($"{transaction.User.Username} bought {count} x {transaction.Product.Name} for {transaction.Product.Price}");
  }

  public void DisplayUserInfo(User user)
  {
    Console.WriteLine($"{user} has {user.Balance} credits");
    IEnumerable<BuyTransaction> transactions = StregSystem.GetTransactions<BuyTransaction>(user, 10);
    foreach (ITransaction transaction in StregSystem.GetTransactions<BuyTransaction>(user, 10))
    {
      Console.WriteLine(transaction);
    }
  }

  public void DisplayUserNotFound(string username)
  {
    Console.WriteLine($"User [{username}] not found");
  }

  public void NotifyUserBalance(User user, decimal balance)
  {
    Console.WriteLine($"{user.Firstname}, only have {balance}$ left with us! Remember to deposit money to your account before it's too late.");
  }

  void DisplayProductsMenu()
  {
    Console.WriteLine("ID | Produkt | Pris");
    foreach (Product product in StregSystem.ActiveProducts)
    {
      Console.WriteLine($"{product.ID} | {product.Name} | {product.Price}");
    }
  }

  public void Start()
  {
    Running = true;
    DisplayProductsMenu();

    while (Running)
    {
      ReadUserInput();
    }
  }

  void ReadUserInput()
  {
    string? command = Console.ReadLine();
    if (command != null && CommandEntered != null) CommandEntered(command);
  }


  public event StregSystemHandler? CommandEntered;
}