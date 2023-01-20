using static User;

interface IStregSystem
{
  IEnumerable<Product> ActiveProducts { get; }
  InsertCashTransaction AddCreditsToAccount(User user, int amount);
  BuyTransaction BuyProduct(User user, Product product);
  List<BuyTransaction> BuyProduct(User user, Product product, int count);
  Product GetProductById(int id);
  IEnumerable<T> GetTransactions<T>(User user, int count) where T : ITransaction;
  List<User> GetUsers(Func<User, bool> predicate);
  User GetUserByUsername(string username);
  event UserBalanceNotification UserBalanceWarning;
}