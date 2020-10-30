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
    class procedure SaveHeadNakl(Unicum_Num, KolProdBuild: integer);

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
  AppDataLocal.Connection.StartTransaction;
  try
    AppDataLocal.Command.Active := False;
    AppDataLocal.Command.Command.Execute(Format(SSQLDeleteOrdersMove, [Unicum_Num]));
  except
    AppDataLocal.Connection.Rollback;
  end;
end;

procedure TNaklAction.Delete;
begin
  AppDataLocal.Connection.StartTransaction;
  try
    AppDataLocal.Command.Active := False;
    AppDataLocal.Command.Command.Execute(SSQLClearOrdersMove);
  except
    AppDataLocal.Connection.Rollback;
  end;
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

  AppDataLocal.Connection.StartTransaction;
  try
    AppDataLocal.Command.Active := False;
    AppDataLocal.Command.Command.Execute(Format(SSQLUpdateStatusOrdersMove, [Status,
                                                                             Unicum_Num,
                                                                             Article.ToString]));
  except
    AppDataLocal.Connection.Rollback;
  end;
end;

class procedure TNaklAction.SaveHeadNakl(Unicum_Num, KolProdBuild: integer);
begin
  if KolProdBuild > 0 then
  try
    AppDataLocal.Connection.StartTransaction;
  except
    AppDataLocal.Connection.Rollback;
  end;

end;

procedure TNaklAction.Get;
begin
    //
end;

end.
