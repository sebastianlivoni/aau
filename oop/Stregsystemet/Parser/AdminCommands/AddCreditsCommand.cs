
class AddCreditsCommand : AdminCommand
{
  public AddCreditsCommand(IStregSystemUI ui, IStregSystem stregSystem, string[] args) : base(ui, stregSystem, args) { }

  public override void Execute()
  {
    User user = _stregsystem.GetUserByUsername(_args[0]);
    _stregsystem.AddCreditsToAccount(user, Int32.Parse(_args[1]));
  }
}