
class CloseCommand : AdminCommand
{
  public CloseCommand(IStregSystemUI ui, IStregSystem stregsystem, string[] args) : base(ui, stregsystem, args) { }

  public override void Execute()
  {
    _ui.Close();
  }
}