unit ProcessedDoc;

interface

uses Interfaces, System.SysUtils;

type
 TProcessedDoc = class(TInterfacedObject, IInterfaceMove)

  public
    procedure Add; overload;
    class procedure Add(BegD, EndD: TDate); overload;
    class procedure Add(Unicum_Num: integer; OrderDatePD: string;
      Keeper: string; KeeperUID: integer;
      Collector: string; CollectorUID: integer;
      Status: integer); overload;

    procedure Delete; overload;
    class procedure Delete(Unicum_Num: integer); overload;

    procedure Get(); overload;
    class procedure Get(CollectorUID: integer); overload;
    class procedure Get(BegOD, EndOD: string); overload;
    class procedure Get(CollectorUID: integer; BegOD, EndOD: string); overload;

    constructor Create(); overload;
    constructor Create(BegOD, EndOD: string); overload;
    constructor Create(CollectorUID: integer; BegOD, EndOD: string); overload;
 end;

implementation



{ TProcessedDoc }

uses ModuleDataLocal, Globals, SConsts, ModuleDataRemote;

procedure TProcessedDoc.Add;
begin
  //
end;

class procedure TProcessedDoc.Add(Unicum_Num: integer; OrderDatePD: string;
  Keeper: string; KeeperUID: integer; Collector: string; CollectorUID: integer; Status: integer);
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
                                                                            Status]));
      except
        AppDataLocal.Connection.Rollback;
      end;
    finally
      AppDataLocal.Connection.Commit;
    end;
end;

class procedure TProcessedDoc.Add(BegD, EndD: TDate);
begin
  //DONE -opmp:  ѕолучить информацию об обработанных накладных с удаленного сервера
   if not AppDataRemote.Connection.Connected then
     AppDataRemote.ConnectToExternalDB();

   AppDataRemote.ProcessedDoc.Active := False;
   AppDataRemote.ProcessedDoc.SQL.Text := Format(SSQLGetProcessedDocs, [FormatDateTime('yyyy-mm-dd', BegD),
                                                                        FormatDateTime('yyyy-mm-dd', EndD)]);
   AppDataRemote.ProcessedDoc.Active := True;

   if not AppDataRemote.ProcessedDoc.IsEmpty then
    try
      while not AppDataRemote.ProcessedDoc.Eof do
      begin
         TProcessedDoc.Add(AppDataRemote.ProcessedDoc.FieldByName('FolioUID').AsInteger,
                           AppDataRemote.ProcessedDoc.FieldByName('DATE_P_POR').AsString,
                           AppDataRemote.ProcessedDoc.FieldByName('Keeper').AsString,
                           AppDataRemote.ProcessedDoc.FieldByName('KeeperUID').AsInteger,
                           AppDataRemote.ProcessedDoc.FieldByName('Collector').AsString,
                           AppDataRemote.ProcessedDoc.FieldByName('CollectorUID').AsInteger,
                           AppDataRemote.ProcessedDoc.FieldByName('Status').AsInteger);
         AppDataRemote.ProcessedDoc.Next;
      end;
    finally
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

class procedure TProcessedDoc.Get(CollectorUID: integer);
begin

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
   try
     AppDataLocal.CollectorBuild.Active := False;
     AppDataLocal.CollectorBuild.SQL.Text := SSQLGetCollectCountOrdersHead;
     AppDataLocal.CollectorBuild.Active := True;
   except
     AppDataLocal.CollectorBuild.Active := False;
   end;
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
