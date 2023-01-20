
abstract class AdminCommand : Command
{
  public string[] _args { get; }

  public AdminCommand(IStregSystemUI ui, IStregSystem stregSystem, string[] args) : base(ui, stregSystem)
  {
    _args = args;
  }

  public override abstract void Execute();
}