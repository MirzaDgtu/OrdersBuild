unit KeeperAct;

interface

uses Interfaces, System.SysUtils;

type
  TKeeperAction = class
    public
      procedure Add(KeeperUID: integer; KeeperName: string;
                    CollectorUID: integer; CollectorName: string);
      class procedure Get(KeeperUID: integer);
      procedure Delete(KeeperUID, CollectorUID: Integer);
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
