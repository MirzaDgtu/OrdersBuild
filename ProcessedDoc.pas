unit ProcessedDoc;

interface

uses Interfaces, System.SysUtils;

type
 TProcessedDoc = class(TInterfacedObject, IInterfaceMove)

  public
    procedure Add; overload;
    class procedure Add(Unicum_Num: integer; OrderDatePD: string;
      Keeper: string; KeeperUID: integer;
      Collector: string; CollectorUID: integer; OrderBuildDate: string); overload;

    procedure Delete; overload;
    class procedure Delete(Unicum_Num: integer); overload;

    procedure Get(); overload;
    class procedure Get(BegOD, EndOD: string); overload;
    class procedure Get(CollectorUID: integer; BegOD, EndOD: string); overload;

    constructor Create(); overload;
    constructor Create(BegOD, EndOD: string); overload;
    constructor Create(CollectorUID: integer; BegOD, EndOD: string); overload;
 end;

implementation



{ TProcessedDoc }

uses ModuleDataLocal, Globals, SConsts;

procedure TProcessedDoc.Add;
begin
  //TODO -opmp:  ѕолучить информацию об обработанных накладных с удаленного сервера
end;

class procedure TProcessedDoc.Add(Unicum_Num: integer; OrderDatePD: string;
  Keeper: string; KeeperUID: integer; Collector: string; CollectorUID: integer;
  OrderBuildDate: string);
begin

    try
      AppDataLocal.Connection.StartTransaction;
      try
        AppDataLocal.Command.Active := False;
        AppDataLocal.Command.Command.Execute(Format(SSQLAddCollectorOrder, [Unicum_Num.toString,
                                                                            OrderDatePD,
                                                                            Keeper,
                                                                            KeeperUID,
                                                                            Collector,
                                                                            CollectorUID,
                                                                            FormatDateTime('yyyy-mm-dd', Now),
                                                                            3]));
      except
        AppDataLocal.Connection.Rollback;
      end;
    finally
      AppDataLocal.Connection.Commit;
    end;
end;

constructor TProcessedDoc.Create(CollectorUID: integer; BegOD, EndOD: string);
begin
  inherited Create();
  TProcessedDoc.Get(CollectorUID, BegOD, EndOD);
end;

constructor TProcessedDoc.Create(BegOD, EndOD: string);
begin
   inherited Create();
   TProcessedDoc.Get(BegOD, EndOD);
end;

class procedure TProcessedDoc.Delete(Unicum_Num: integer);
begin
  try
   AppDataLocal.Connection.StartTransaction;
     try
       AppDataLocal.Command.Command.Execute(Format(SSQLDeleteProcessedOrder, [Unicum_Num.ToString]));
     except
       AppDataLocal.Connection.Rollback;
     end;
  finally
    AppDataLocal.Connection.Commit;
  end;
end;

constructor TProcessedDoc.Create;
begin
  inherited Create();
end;

procedure TProcessedDoc.Delete;
begin
  try
    AppDataLocal.Connection.StartTransaction;
    try
      AppDataLocal.Command.Command.Execute(SSQLClearProcessedOrders);
    except
      AppDataLocal.Connection.Rollback;
    end;
  finally
    AppDataLocal.Connection.Commit;
  end;
end;

procedure TProcessedDoc.Get;
begin
  //
end;

class procedure TProcessedDoc.Get(BegOD, EndOD: string);
begin
   try
     AppDataLocal.CollectorBuild.Active := False;
     AppDataLocal.CollectorBuild.SQL.Text := Format(SSQLGetCollectCountOrders, [BegOD,
                                                                                EndOD]);
     AppDataLocal.CollectorBuild.Active := True;
   except
     AppDataLocal.CollectorBuild.Active := False;
   end;
end;

class procedure TProcessedDoc.Get(CollectorUID: integer; BegOD, EndOD: string);
begin
  try
    AppDataLocal.CollectorOrders.Active := False;
    AppDataLocal.CollectorOrders.SQL.Text := Format(SSQLGetCollectOrdersAtCollectUID, [BegOD,
                                                                                       EndOD,
                                                                                       CollectorUID]);
    AppDataLocal.CollectorOrders.Active := True;
  except
    AppDataLocal.CollectorOrders.Active := False;
  end;
end;

end.
