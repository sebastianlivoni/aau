
class UserInfoCommand : Command
{
  string _username { get; }

  public UserInfoCommand(IStregSystemUI ui, IStregSystem stregSystem, string username) : base(ui, stregSystem)
  {
    _username = username;
  }

  public override void Execute()
  {
    User user = _stregsystem.GetUserByUsername(_username);
    _ui.DisplayUserInfo(user);
  }
}