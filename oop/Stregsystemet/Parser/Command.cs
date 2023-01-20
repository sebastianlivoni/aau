abstract class Command
{
  public IStregSystemUI _ui { get; }
  public IStregSystem _stregsystem { get; }

  public Command(IStregSystemUI ui, IStregSystem stregSystem)
  {
    _ui = ui;
    _stregsystem = stregSystem;
  }

  public abstract void Execute();
}