class StregsystemCommandParser
{
  public StregsystemCommandParser(IStregSystemUI StregsystemUI, IStregSystem Stregsystem)
  {
    _stregsystem = Stregsystem;
    _stregsystemUI = StregsystemUI;

    _adminCommands = new Dictionary<string, Func<string[], AdminCommand>>() {
      { ":q", (args) => CloseCommand(args) },
      { ":quit", (args) => CloseCommand(args) },
      { ":addcredits", (args) => AddCreditsCommand(args)},
      { ":crediton", (args) => CreditOnCommand(args) },
      { ":creditoff", (args) => CreditOffCommand(args) },
      { ":activate", (args) => ActivateProductCommand(args) },
      { ":deactivate", (args) => DeActivateProductCommand(args) }
    };
  }

  IStregSystem _stregsystem { get; set; }
  IStregSystemUI _stregsystemUI { get; set; }

  Dictionary<string, Func<string[], AdminCommand>> _adminCommands;

  Command UserInfoCommand(string username) => new UserInfoCommand(_stregsystemUI, _stregsystem, username);
  Command UserBuysProductCommand(string username, string productNumber) => new UserBuysProductCommand(_stregsystemUI, _stregsystem, username, productNumber);
  Command UserBuysMultipleProductsCommand(string username, string count, string productNumber) => new UserBuysMultipleProductsCommand(_stregsystemUI, _stregsystem, username, productNumber, count);

  AdminCommand CloseCommand(string[] args) => new CloseCommand(_stregsystemUI, _stregsystem, args);
  AdminCommand AddCreditsCommand(string[] args) => new AddCreditsCommand(_stregsystemUI, _stregsystem, args);
  AdminCommand CreditOnCommand(string[] args) => new CreditOnCommand(_stregsystemUI, _stregsystem, args);
  AdminCommand CreditOffCommand(string[] args) => new CreditOffCommand(_stregsystemUI, _stregsystem, args);
  AdminCommand ActivateProductCommand(string[] args) => new ActivateProductCommand(_stregsystemUI, _stregsystem, args);
  AdminCommand DeActivateProductCommand(string[] args) => new DeActivateProductCommand(_stregsystemUI, _stregsystem, args);

  public void ParseCommand(string command)
  {
    string[] args = command.Split(" ");

    if (String.IsNullOrWhiteSpace(args[0]))
    {
      _stregsystemUI.DisplayGeneralError("Received empty arguments. Please provide these!");
      return;
    }

    try
    {
      if (command.StartsWith(":"))
      {
        ParseAdminCommand(args[0], args.Skip(1).ToArray());
      }
      else
      {
        ParseDefaultCommand(args);
      }
    }
    catch (ProductNotFoundException e)
    {
      _stregsystemUI.DisplayProductNotFound(e.Message);
    }
    catch (UserNotFoundException e)
    {
      _stregsystemUI.DisplayUserNotFound(e.Message);
    }
    catch (InsufficientCreditsException)
    {
      throw new NotImplementedException();
    }
    catch (Exception e)
    {
      _stregsystemUI.DisplayGeneralError(e.Message);
    }
  }

  void ParseAdminCommand(string command, string[] args)
  {
    _adminCommands[command](args).Execute();
  }

  void ParseDefaultCommand(string[] args)
  {
    switch (args.Length)
    {
      case 1:
        UserInfoCommand(args[0]).Execute();
        break;
      case 2:
        UserBuysProductCommand(args[0], args[1]).Execute();
        break;
      case 3:
        UserBuysMultipleProductsCommand(args[0], args[1], args[2]).Execute();
        break;
      default:
        _stregsystemUI.DisplayTooManyArgumentsError(string.Join(" ", args));
        break;
    }
  }
}
