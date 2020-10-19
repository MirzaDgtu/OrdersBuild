unit Reestrs;

interface

uses Globals, Interfaces, ModuleDataLocal, SConsts;

type
  TReestrs = class(TInterfacedObject, IInterfaceMove)

  public
    procedure Add;
    procedure Delete;
    class procedure Get;

   constructor Create(); override;
  end;

implementation

{ TReestrs }

procedure TReestrs.Add;
begin
   //
end;

constructor TReestrs.Create;
begin
  inherited;
  Get();
end;

procedure TReestrs.Delete;
begin
  try
     AppDataLocal.Connection.StartTransaction;

     AppDataLocal.Command.Active := False;
     AppDataLocal.Command.SQL.Text := SSQLDeleteReestrs;
     AppDataLocal.Command.ExecSQL;
  except
     AppDataLocal.Connection.Rollback;
  end;
end;

class procedure TReestrs.Get;
begin
  try
   AppDataLocal.Reestrs.Active := False;
   AppDataLocal.Reestrs.SQL.Text := SSQLGetReestrs;
   AppDataLocal.Reestrs.Active := True;
  except
  end;
end;

end.
