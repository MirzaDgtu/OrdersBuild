unit ConnectRemove;

interface
uses Globals, System.SysUtils;

type
  TConnectRemove = class
    private
    public
      procedure Get(out ConnectLocal: TConnectLocal);
      procedure Add(Server, InitialCatalog, Login, Password: string; Port: Int16);
      procedure setDefaultConnectSetting();

      constructor Create(out ConnectLocal: TConnectLocal); overload;
  end;

implementation

uses ModuleDataLocal, SConsts;

{ TConnectRemove }

procedure TConnectRemove.Add(Server, InitialCatalog, Login, Password: string;
  Port: Int16);
begin
  try
    AppDataLocal.Connection.StartTransaction;
     try
        AppDataLocal.Command.SQL.Text := Format(SSQLAddConnectionSetting, [Server,
                                                                           InitialCatalog,
                                                                           Login,
                                                                           Password,
                                                                           Port]);
        AppDataLocal.Command.ExecSQL;
     except
        AppDataLocal.Connection.Rollback;
     end;
  finally
    AppDataLocal.Connection.Commit;
  end;
end;

constructor TConnectRemove.Create(out ConnectLocal: TConnectLocal);
begin
  inherited Create;
  Get(ConnectLocal);
end;

procedure TConnectRemove.Get(out ConnectLocal: TConnectLocal);
begin
  try
    AppDataLocal.EveryOne.Active := False;
    AppDataLocal.EveryOne.SQL.Text := SSQLGetConnectSetting;
    AppDataLocal.EveryOne.Active :=  True;

    if not AppDataLocal.EveryOne.IsEmpty then
      try
        ConnectLocal.Sever := AppDataLocal.EveryOne.FieldByName('ServerName').AsString;
        ConnectLocal.InitialCatalog := AppDataLocal.EveryOne.FieldByName('InitialCatalog').AsString;
        ConnectLocal.login := AppDataLocal.EveryOne.FieldByName('UserLogin').AsString;
        ConnectLocal.Password := AppDataLocal.EveryOne.FieldByName('UserPassword').AsString;
        ConnectLocal.Port := AppDataLocal.EveryOne.FieldByName('Port').AsInteger;
      except
         FillChar(ConnectLocal, SizeOf(TConnectLocal), #0);
      end;
  finally
  end;
end;

procedure TConnectRemove.setDefaultConnectSetting;
begin
  Add('192.168.0.7\F2012SQL', 'DELIVERY', 'pmp', 'M5i4r6z3a210', 1433);
end;

end.
