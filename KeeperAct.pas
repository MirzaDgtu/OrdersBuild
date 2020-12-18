unit KeeperAct;

interface

uses Interfaces, System.SysUtils;

type
  TKeeperAction = class
    public
      procedure Add(KeeperUID: integer; KeeperName: string;
                    CollectorUID: integer; CollectorName: string); overload;
      procedure Delete(KeeperUID, CollectorUID: Integer); overload;

      class procedure Add; overload;
      class procedure Get(KeeperUID: integer);
      class procedure Delete(); overload; // Очищает весь список сборщиков

  end;

implementation


{ TKeeperAction }

uses ModuleDataLocal, ModuleDataRemote, Globals, SConsts;

procedure TKeeperAction.Add(KeeperUID: integer; KeeperName: string;
  CollectorUID: integer; CollectorName: string);
begin
   AppDataLocal.Connection.StartTransaction;
   try
     try
        AppDataLocal.Command.Command.Execute(Format(SSQLInsKeeperAccessLoc, [KeeperUID, KeeperName,
                                                                             CollectorUID, CollectorName]));
     except
      AppDataLocal.Connection.Rollback;
     end;
   finally
     AppDataLocal.Connection.Commit;
   end;
end;

class procedure TKeeperAction.Add;
  procedure getKeeperTeam();
  Begin
    AppDataRemote.KeeperAccess.Active := False;
    AppDataRemote.KeeperAccess.SQL.Text := SSQLGetKeeperTeam;
    AppDataRemote.KeeperAccess.Active := True;
  End;
begin
  getKeeperTeam();

  if not AppDataRemote.KeeperAccess.IsEmpty then
    try
      TKeeperAction.Delete;

      AppDataLocal.Connection.StartTransaction;
     // try
         while not AppDataRemote.KeeperAccess.Eof do
         begin
           AppDataLocal.Command.Command.Execute(Format(SSQLInsKeeperAccessLoc, [AppDataRemote.KeeperAccess.FieldByName('KeeperUID').AsInteger,
                                                                                AppDataRemote.KeeperAccess.FieldByName('KeeperName').AsString,
                                                                                AppDataRemote.KeeperAccess.FieldByName('CollectorUID').AsInteger,
                                                                                AppDataRemote.KeeperAccess.FieldByName('CollectorName').AsString]));
           AppDataRemote.KeeperAccess.Next;
         end;
     // except
     //    AppDataLocal.Connection.Rollback;
     // end;
    finally
      AppDataLocal.Connection.Commit;
    end;
end;

class procedure TKeeperAction.Delete;
begin
  AppDataLocal.Connection.StartTransaction;

  try
    try
       AppDataLocal.Command.Command.Execute(SSQLClearKeeperAccessLoc);
    except
      AppDataLocal.Connection.Rollback;
    end;
  finally
    AppDataLocal.Connection.Commit;
  end;
end;

procedure TKeeperAction.Delete(KeeperUID, CollectorUID: Integer);
begin
   AppDataLocal.Connection.StartTransaction;
   try
     try
        AppDataLocal.Command.Command.Execute(Format(SSQLDelKeeperAccess, [KeeperUID,
                                                                          CollectorUID]));
     except
      AppDataLocal.Connection.Rollback;
     end;
   finally
     AppDataLocal.Connection.Commit;
   end;
end;

class procedure TKeeperAction.Get(KeeperUID: integer);
begin
   AppDataLocal.KeeperAccess.Active := False;
   AppDataLocal.KeeperAccess.SQL.Text := Format(SSQLGetKeeperAccessLoc, [KeeperUID]);
   AppDataLocal.KeeperAccess.Active := True;
end;

end.
