unit Users;

interface
  uses System.SysUtils;

type
  TUsers = class
    private
    public
      procedure Clear();
      class procedure Get();
      procedure GetLastUser(out ID: integer);
      procedure Add(ID: integer; Login, Name: String);
      procedure Update(ID: integer; Status: smallint);
      procedure SetCurrentuser(ID: integer; Login, Name: String);

    constructor Create();
  end;



implementation

uses SConsts, ModuleDataLocal, Globals;



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
end;

class procedure TUsers.Get;
begin
    AppDataLocal.Users.Active := False;
    AppDataLocal.Users.SQL.Text := SSQLGetUsersLocal;
    AppDataLocal.Users.Active := True;
end;

procedure TUsers.GetLastUser(out ID: integer);
begin
  try
     AppDataLocal.EveryOne.Active := False;
     AppDataLocal.EveryOne.SQL.Text := SSQLGetLastUserLocal;
     AppDataLocal.EveryOne.Active := True;
  finally
    if not AppDataLocal.EveryOne.IsEmpty then
      ID := AppDataLocal.EveryOne.FieldByName('ID').AsInteger;
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

procedure TUsers.Update(ID: integer; Status: smallint);
begin
  try
    AppDataLocal.Connection.StartTransaction;
    AppDataLocal.Command.ExecSQL(Format(SSQLUpdateLastUserLocal, [id,
                                                                  Status]));
  except
    AppDataLocal.Connection.Rollback;
  end;
end;

end.
