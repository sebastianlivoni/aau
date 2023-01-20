class EmailAddressValidation : IValidation<string>
{
  public bool isValid(string email)
  {
    int index = email.IndexOf('@');
    if (index < 1 || email.LastIndexOf(".") < index + 2) return false;
    if (email.LastIndexOf(".") == index + 1 || email.LastIndexOf(".") == email.Length) return false;
    if (email.LastIndexOf("-") == index + 1 || email.LastIndexOf("-") == email.Length) return false;

    return true;
  }
}