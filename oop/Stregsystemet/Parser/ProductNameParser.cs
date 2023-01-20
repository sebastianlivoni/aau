using System.Text.RegularExpressions;

static class ProductNameParser
{
  public static string Parse(string name)
  {
    string parsed = Regex.Replace(name, "<.*?>", String.Empty);
    parsed = parsed.Trim('"', ' ');
    return parsed;
  }
}