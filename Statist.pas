unit Statist;

interface

uses ModuleDataLocal, SConsts, System.SysUtils, Globals, Interfaces;

type
  TStatist = class(TInterfacedObject, IInterfaceMove)

  public
    procedure Add; overload;    // дл€ случа€ получени€ информации из удаленного репозитори€
    procedure Add(FolioUID: real; OrderDate: string;  Keeper: string; KeeperUID: integer; Collector: string; CollectorUID: integer; OrderBuildDate: TDateTime); overload;  // в случае полной сборки накладной
    procedure Delete; overload;
    procedure Delete(UID: integer); overload;
    procedure Get;

    constructor Create();
  end;

implementation


{ TStatist }

procedure TStatist.Add;
begin
   // ƒописать после добавлени€ св€зи с удаленным сервером
end;

procedure TStatist.Add(FolioUID: real; OrderDate: string; Keeper: string;
  KeeperUID: integer; Collector: string; CollectorUID: integer; OrderBuildDate: TDateTime);
begin
  try
    AppDataLocal.Connection.StartTransaction;
    AppDataLocal.Command.Active := False;
    AppDataLocal.Command.SQL.Text := Format(SSQLAddCollectorOrder, [FloatToStr(FolioUID),
                                                                    OrderDate,
                                                                    Keeper,
                                                                    KeeperUID,
                                                                    Collector,
                                                                    CollectorUID,
                                                                    FormatDateTime('yyyy-mm-dd hh:mm:ss', Now())]);
    AppDataLocal.Command.ExecSQL;
  except
    AppDataLocal.Connection.Rollback;
  end;
end;

constructor TStatist.Create;
begin
  Inherited Create();
   Get();
end;

procedure TStatist.Delete(UID: integer);
begin
  try
    AppDataLocal.Connection.StartTransaction;
    AppDataLocal.Command.Active := False;
    AppDataLocal.Command.SQL.Text := Format(SSQLDeleteCollectOrder, [UID]);
    AppDataLocal.Command.ExecSQL;
  except
    AppDataLocal.Connection.Rollback;
  end;
end;

procedure TStatist.Delete;
begin
   try
     AppDataLocal.Connection.StartTransaction;
     AppDataLocal.Command.Active :=False;
     AppDataLocal.Command.SQL.Text := SSQLClearCollectOrders;
     AppDataLocal.Command.ExecSQL;
   finally
     AppDataLocal.Connection.Rollback;
   end;
end;

procedure TStatist.Get;
begin
  try
    AppDataLocal.CollectorBuild.Active := False;
    AppDataLocal.CollectorBuild.SQL.Text := Format(SSQLGetCollectCountOrders, [DatesLocal.DBeg,
                                                                               DatesLocal.DEnd]);
    AppDataLocal.CollectorBuild.Active := True;
  except
  end;

end;

end.
