unit NaklAct;

interface

uses Interfaces, System.SysUtils;

type
  TNaklAction = class(TInterfacedObject, IInterfaceMove)

  public
    procedure Add;
    procedure Delete;
    procedure Get; overload;
    class procedure Get(Unicum_Num: integer); overload;

    constructor Create(Unicum_Num: integer);
  end;

implementation


{ TNaklAction }

uses ModuleDataLocal, SConsts;

procedure TNaklAction.Add;
begin
   //
end;

constructor TNaklAction.Create(Unicum_Num: integer);
begin
  inherited Create();
  TNaklAction.Get(Unicum_Num);
end;

procedure TNaklAction.Delete;
begin
  //
end;

class procedure TNaklAction.Get(Unicum_Num: integer);
begin
  try
     AppDataLocal.OrdersMove.Active := False;
     AppDataLocal.OrdersMove.SQL.Text := Format(SSQLGetOrdersMove, [Unicum_Num]);
     AppDataLocal.OrdersMove.Active := True;
  except
  end;
end;

procedure TNaklAction.Get;
begin
    //
end;

end.
