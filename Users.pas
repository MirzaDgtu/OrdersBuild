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
      procedure Update();
      procedure SetCurrentuser(ID: integer; Login, Name: String);

    constructor Create();
  end;



implementation

uses SConsts, ModuleDataLocal, ModuleDataRemote;



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
  TUsers.Get();
  GetLastUser(CurrentUser);
end;

class procedure TUsers.Get;
begin
  try
    AppDataLocal.Users.Active := False;
    AppDataLocal.Users.SQL.Text := SSQLGetUsersLocal;
    AppDataLocal.Users.Active := True;
  except
  end;
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

procedure TUsers.Update;
begin
  try
   if not AppDataRemote.Connection.Connected then
      AppDataRemote.ConnectToExternalDB();

   AppDataRemote.Users.Active := False;
   AppDataRemote.Users.SQL.Text := Format(SSQLGetUsers, [0]);
   AppDataRemote.Users.Active := True;

   if not AppDataRemote.Users.IsEmpty then
     try
        Clear();

        AppDataRemote.Users.First;

        while not AppDataRemote.Users.Eof do
          try
            Add(AppDataRemote.UsersUID.AsInteger, AppDataRemote.UserssName.AsString, AppDataRemote.UsersEmployeeName.AsString);
            AppDataRemote.Users.Next;
          except
            AppDataLocal.Connection.Rollback;
          end;

     except
            AppDataLocal.Connection.Rollback;
     end;
  finally
     AppDataRemote.Connection.Connected := False;
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
