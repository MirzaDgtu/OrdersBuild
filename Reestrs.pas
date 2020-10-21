unit Reestrs;

interface

uses Globals, Interfaces, ModuleDataLocal, SConsts;

type
  TReestrs = class(TInterfacedObject, IInterfaceMove)

  public
    procedure Add;
    procedure Delete;
    procedure Get;

   constructor Create();
  end;

implementation

{ TReestrs }


procedure TReestrs.Add;
begin
   //
end;

constructor TReestrs.Create;
begin
  inherited Create;
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

procedure TReestrs.Get;
begin
  try
   AppDataLocal.Reestrs.Active := False;
   AppDataLocal.Reestrs.Active := True;
  except
  end;
end;


end.
