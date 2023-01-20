using System.Text.RegularExpressions;

class UsernameValidation : IValidation<string>
{
  public bool isValid(string username)
  {
    return new Regex(@"^[a-z0-9_]+$").IsMatch(username);
  }
}