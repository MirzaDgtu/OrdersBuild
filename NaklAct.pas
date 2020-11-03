unit NaklAct;

interface

uses Interfaces, System.SysUtils;

type
  TNaklAction = class(TInterfacedObject, IInterfaceMove)

  private
    class procedure setHeadNaklDefault(Unicum_Num: integer);

  public
    procedure Add;
    procedure Delete; overload;
    procedure Delete(Unicum_Num: integer); overload;
    class procedure setMoveNaklDefault(Unicum_Num: integer);

    procedure Get; overload;
    class procedure Get(Unicum_Num: integer); overload;                                 // ��������� ������ ������� ���������
    class procedure SaveBuildProd(Unicum_Num, Article, Status: integer);                // ��������� ������� ������ ���������
    class procedure SaveHeadNakl(Unicum_Num, KolProd, KolProdBuild: integer);           // ��������� ������� ����� ���������

    constructor Create(Unicum_Num: integer);
  end;

implementation


{ TNaklAction }

uses ModuleDataLocal, SConsts, ProcessedDoc, Globals;

procedure TNaklAction.Add;
begin
   //todo -opmp: �������� ��������� �� ���������� �����������
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
                                                                             Unicum_Num.ToString,
                                                                             Article.ToString]));
  except
    AppDataLocal.Connection.Rollback;
  end;
end;

class procedure TNaklAction.SaveHeadNakl(Unicum_Num, KolProd, KolProdBuild: integer);
var
  strReq: string;
begin
  setHeadNaklDefault(Unicum_Num);

  if KolProdBuild > 0 then
  try
    AppDataLocal.Connection.StartTransaction;
    TProcessedDoc.Delete(Unicum_Num);

    if (KolProd > KolProdBuild) and
       (KolProdBuild > 0) then
         strReq := Format(SSQLUpdateStatusOrdersHeader, [2,  Unicum_Num.ToString])
    else if (KolProdBuild > 0) and
            (KolProd = KolProdBuild) then
         Begin
           strReq := Format(SSQLUpdateStatusOrdersHeader, [3, Unicum_Num.ToString]);
           TProcessedDoc.Add(Unicum_Num, NaklRec.OrderDate, CurrentUser.Name, CurrentUser.ID,
                             CollectorNakl.Name, CollectorNakl.UID, FormatDateTime('yyyy-mm-dd', Now()));
         End
    else
         strReq := Format(SSQLUpdateStatusOrdersHeader, [1, Unicum_Num.ToString]);

    AppDataLocal.Command.Command.Execute(strReq);
  except
    AppDataLocal.Connection.Rollback;
  end;
end;

class procedure TNaklAction.setHeadNaklDefault(Unicum_Num: integer);
begin
  AppDataLocal.Connection.StartTransaction();
  try
    AppDataLocal.Command.Command.Execute(Format(SSQLSetDefaultStatusHeadOrders, [Unicum_Num.ToString]));
  except
    AppDataLocal.Connection.Rollback;
  end;
end;

class procedure TNaklAction.setMoveNaklDefault(Unicum_Num: integer);
begin
  AppDataLocal.Connection.StartTransaction();
  try
    AppDataLocal.Command.Command.Execute(Format(SSQLSetDefaultStatusOrdersMove, [Unicum_Num.ToString]));
  except
    AppDataLocal.Connection.Rollback();
  end;
end;

procedure TNaklAction.Get;
begin
    //
end;

end.
