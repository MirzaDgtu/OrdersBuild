unit Users;

interface
  uses System.SysUtils, Globals;

type
  TUsers = class
    private
    public
      procedure Clear();
      class procedure Get();
      procedure GetLastUser(out User: TUser);
      procedure Add(ID: integer; Login, Name: String);
      procedure UpdatelastUser(ID: integer; Status: smallint);
      procedure SetCurrentuser(ID: integer; Login, Name: String);

    constructor Create();
  end;



implementation

uses SConsts, ModuleDataLocal;



{ TUsers }

procedure TUsers.Add(ID: integer; Login, Name: String);
begin
  try
   AppDataLocal.Connection.StartTransaction;
    AppDataLocal.Command.ExecSQL(Format(SSQLAddUsersLocal, [ID,
                                                            Login,
                                                            Name]));
  except
    AppDataLocal.Connection.Rollback;
  end;
end;

procedure TUsers.Clear;
begin
  try
   AppDataLocal.Connection.StartTransaction;
   AppDataLocal.Command.ExecSQL(SSQLClearUsersLocal);
  except
    AppDataLocal.Connection.Rollback;
  end;
end;

constructor TUsers.Create;
begin
  inherited Create();
  Get();
  GetLastUser(CurrentUser);
end;

class procedure TUsers.Get;
begin
    AppDataLocal.Users.Active := False;
    AppDataLocal.Users.SQL.Text := SSQLGetUsersLocal;
    AppDataLocal.Users.Active := True;
end;

procedure TUsers.GetLastUser(out User: TUser);
begin
  try
     AppDataLocal.EveryOne.Active := False;
     AppDataLocal.EveryOne.SQL.Text := SSQLGetLastUserLocal;
     AppDataLocal.EveryOne.Active := True;
  finally
    if not AppDataLocal.EveryOne.IsEmpty then
      Begin
       User.ID := AppDataLocal.EveryOne.FieldByName('ID').AsInteger;
       User.Login := AppDataLocal.EveryOne.FieldByName('UserLogin').AsString;
       User.Name := AppDataLocal.EveryOne.FieldByName('UserName').AsString;
      End;
  end;
end;

procedure TUsers.SetCurrentuser(ID: integer; Login, Name: String);
begin
  try
    CurrentUser.ID := ID;
    CurrentUser.Login := Login;
    CurrentUser.Name := Name;
  except
    FillChar(CurrentUser, SizeOf(TUsers), #0);
  end;
end;

procedure TUsers.UpdatelastUser(ID: integer; Status: smallint);
begin
  try
    AppDataLocal.Connection.StartTransaction;
    AppDataLocal.Command.SQL.Text := Format(SSQLUpdateLastUserLocal, [Status,
                                                                      id]);
    AppDataLocal.Command.ExecSQL;
  except
    AppDataLocal.Connection.Rollback;
  end;
end;

end.
