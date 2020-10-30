unit NaklAct;

interface

uses Interfaces, System.SysUtils;

type
  TNaklAction = class(TInterfacedObject, IInterfaceMove)

  public
    procedure Add;
    procedure Delete; overload;
    procedure Delete(Unicum_Num: integer); overload;

    procedure Get; overload;
    class procedure Get(Unicum_Num: integer); overload;
    class procedure SaveBuildProd(Unicum_Num, Article, Status: integer);

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

procedure TNaklAction.Delete(Unicum_Num: integer);
begin
//
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

class procedure TNaklAction.SaveBuildProd(Unicum_Num, Article, Status: integer);
begin
  //
end;

procedure TNaklAction.Get;
begin
    //
end;

end.
