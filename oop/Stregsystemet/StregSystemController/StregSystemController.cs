class StregSystemController
{
  IStregSystem _stregsystem { get; set; }
  IStregSystemUI _stregsystemUI { get; set; }
  StregsystemCommandParser Parser;

  public StregSystemController(IStregSystemUI StregsystemUI, IStregSystem Stregsystem)
  {
    _stregsystem = Stregsystem;
    _stregsystemUI = StregsystemUI;

    Parser = new StregsystemCommandParser(_stregsystemUI, _stregsystem);

    _stregsystemUI.CommandEntered += OnCommandEntered;
  }

  void OnCommandEntered(string command)
  {
    Parser.ParseCommand(command);
  }
}