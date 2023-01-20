using static User;

class StregSystem : IStregSystem
{
  public List<User> Users { get; set; } = new();
  public List<Product> Products { get; set; } = new();
  public List<ITransaction> Transactions { get; set; } = new();

  public IEnumerable<Product> ActiveProducts => Products.Where(product => product.Active == true);

  public StregSystem(CsvReader csvReaderProducts, CsvReader csvReaderUsers)
  {
    Products = csvReaderProducts.GetRecords<Product>();
    Users = csvReaderUsers.GetRecords<User>();
  }

  public InsertCashTransaction AddCreditsToAccount(User user, int amount)
  {
    InsertCashTransaction transaction = new(user, amount);
    transaction.Execute();
    return transaction;
  }

  public BuyTransaction BuyProduct(User user, Product product)
  {
    BuyTransaction transaction = new(user, product);
    ExecuteTransaction(transaction);
    if (user.Balance <= 50)
    {
      UserBalanceWarning?.Invoke(user, user.Balance);
    }
    return transaction;
  }

  public List<BuyTransaction> BuyProduct(User user, Product product, int count)
  {
    if (product.Price * count > user.Balance)
    {
      throw new InsufficientCreditsException();
    }

    List<BuyTransaction> transactions = new();

    for (int i = 0; i < count; i++)
    {
      transactions.Add(BuyProduct(user, product));
    }

    return transactions;
  }

  public Product GetProductById(int id)
  {
    Product? product = Products.FirstOrDefault(product => product.ID == id);

    if (product == null)
    {
      throw new ProductNotFoundException(id.ToString());
    }

    return product;
  }

  public void ExecuteTransaction(ITransaction transaction)
  {
    transaction.Execute();
    Transactions.Add(transaction);
  }

  public IEnumerable<T> GetTransactions<T>(User user, int count) where T : ITransaction
  {
    return Transactions.OfType<T>().Where(transaction => transaction.User == user).Take(count).OrderByDescending(x => x.Date);
  }

  public User GetUserByUsername(string username)
  {
    User? user = Users.FirstOrDefault(user => user.Username == username);

    if (user == null)
    {
      throw new UserNotFoundException(username);
    }

    return user;
  }

  public List<User> GetUsers(Func<User, bool> predicate) => Users.Where(user => predicate(user)).ToList();

  public event UserBalanceNotification? UserBalanceWarning;
}

class ProductNotFoundException : Exception
{
  public ProductNotFoundException(string message) : base(message) { }
}

class UserNotFoundException : Exception
{
  public UserNotFoundException(string message) : base(message) { }
}