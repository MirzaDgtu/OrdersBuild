unit Collectors;

interface

uses Interfaces, ModuleDataLocal, SConsts, Globals;

type
  TCollectors = class(TInterfacedObject, IInterfaceMove)

  public
    procedure Add;
    procedure Delete;
    procedure Get;


    constructor Create();
  end;

implementation

{ TCollectors }

procedure TCollectors.Add;
begin
//
end;

constructor TCollectors.Create;
begin
   inherited Create();
   Get();
end;

procedure TCollectors.Delete;
begin
  AppDataLocal.Connection.StartTransaction;
  try
    AppDataLocal.Command.Command.Execute(SSQlDeleteCollectors);
  except
    AppDataLocal.Connection.Rollback;
  end;
end;

procedure TCollectors.Get;
begin
  try
    AppDataLocal.Collectors.Active := False;
    AppDataLocal.Collectors.SQL.Text := SSQLGetCollectors;
    AppDataLocal.Collectors.Active := True;
  finally
  end;
end;

end.
