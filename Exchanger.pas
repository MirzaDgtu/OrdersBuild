unit Exchanger;

interface

uses System.SysUtils;

type
  TExcangerNakl = class     /// Класс обмена документами с удаленным сервером
   private
    FEndD: TDate;
    FBegD: TDate;
    FReestr: string;
    procedure SetBegD(const Value: TDate);
    procedure SetEndD(const Value: TDate);
    procedure SetReestr(const Value: string);

   public
    procedure getNaklRemote(DBeg, DEnd: TDate; Reestr: string);           // Получение документов с удаленного сервера
    procedure getNaklLocal(DBeg, DEnd: TDate); overload;                  // получение документов с локального сервера
    procedure getNaklLocal(DBeg, DEnd: TDate; Build: smallint); overload; // получение документов с локального сервера
    procedure getNaklDetailRemote(UnicumNum: integer);          // Получение детализации документа с удаленного сервера
    procedure getNaklDetailLocal(UnicumNum: integer);           // Получение детализации документа с локального сервера

    procedure clearNaklHeadLocal();                             // Очистка шапок накладной локальной базы данных
    procedure clearNaklMoveLocal();                             // Очистка детализации накладных локальной базы данных
    procedure clearProcessedDocLocal();                         // Очистка отработанных документов

    procedure addNaklHeadRemoteToLocal();                       // Добавление документов в локальную БД полученных с удаленного сервера
    procedure addNaklMoveRemoteToLocal(UnicumNum: integer);     // Добавление деталихцаии документа в локальную БД полученных с уделенного сервера

    procedure pushNaklHeadLocalToRemote(); overload;                   // Отправление собранных документов с локальной БД на удаленный сервер
    procedure pushNaklHeadLocalToRemote(UnicumNum: integer); overload; // Отправление собранного документа с локальной БД на удаленный сервер
    procedure pushNaklMoveLocalToRemote(UnicumNum: integer);           // Отправление детализации документа с локальной БД на удаленный сервер
    procedure pushProcessedDocLocalToRemote(); overload;                  // Отправка отработанных документов с локального сервера на удаленный сервер
    procedure pushProcessedDocLocalToRemote(BegD, EndD: TDate); overload; // Отправка отработанных документов с локального сервера на удаленный сервер

    procedure start();

    constructor Create(DBeg, DEnd: TDate; Reestr: string); overload;
    destructor  Destroy(); override;

   published
     property BegD: TDate read FBegD write SetBegD;
     property EndD: TDate read FEndD write SetEndD;
     property Reestr: string read FReestr write SetReestr;
  end;

implementation

uses SConsts, Globals, ModuleDataLocal, ModuleDataRemote, ProcessedDoc;

{ TExcangerNakl }

procedure TExcangerNakl.addNaklHeadRemoteToLocal;
begin
   getNaklRemote(Self.BegD, Self.EndD, Self.Reestr);

   if not AppDataRemote.OrdersHeader.IsEmpty then
    try
      AppDataLocal.Connection.StartTransaction();

      try
        AppDataRemote.OrdersHeader.First;
        while not AppDataRemote.OrdersHeader.Eof do
        begin
          AppDataLocal.Command.Command.Execute(Format(SSQLAddOrdersHeader,[AppDataRemote.OrdersHeader.FieldByName('UID').AsInteger,
                                                                           AppDataRemote.OrdersHeader.FieldByName('JournalNo').AsInteger,
                                                                           AppDataRemote.OrdersHeader.FieldByName('OrderUID').AsInteger,
                                                                           AppDataRemote.OrdersHeader.FieldByName('FolioUID').AsInteger,
                                                                           AppDataRemote.OrdersHeader.FieldByName('OrderNo').AsInteger,
                                                                           FormatDateTime('yyyy-mm-dd', AppDataRemote.OrdersHeader.FieldByName('OrderDate').AsDateTime),
                                                                           AppDataRemote.OrdersHeader.FieldByName('AuditStatus').AsInteger,
                                                                           AppDataRemote.OrdersHeader.FieldByName('BRIEFORG').AsString,
                                                                           StringReplace(AppDataRemote.OrdersHeader.FieldByName('ORGANIZNKL').AsString, '''', EmptyStr, [rfReplaceAll]),
                                                                           AppDataRemote.OrdersHeader.FieldByName('L_CP1_PLAT').AsString,
                                                                           AppDataRemote.OrdersHeader.FieldByName('L_CP2_PLAT').AsString,
                                                                           AppDataRemote.OrdersHeader.FieldByName('VID_DOC').AsString,
                                                                           AppDataRemote.OrdersHeader.FieldByName('SUM_ROZN').AsString,
                                                                           AppDataRemote.OrdersHeader.FieldByName('SUM_POR').AsString,
                                                                           AppDataRemote.OrdersHeader.FieldByName('StrikeCode').AsInteger,
                                                                           StringReplace(AppDataRemote.OrdersHeader.FieldByName('NAMEP_USER').AsString,  '''', EmptyStr, [rfReplaceAll]),
                                                                           AppDataRemote.OrdersHeader.FieldByName('ADRES_USER').AsString,
                                                                           AppDataRemote.OrdersHeader.FieldByName('ProjectName').AsString,
                                                                           AppDataRemote.OrdersHeader.FieldByName('Date_Device').AsString]));
          addNaklMoveRemoteToLocal(AppDataRemote.OrdersHeader.FieldByName('FolioUID').AsInteger);
          AppDataRemote.OrdersHeader.Next;
        end;
      except
        AppDataLocal.Connection.Rollback();
      end;
    finally
      AppDataLocal.Connection.Commit;
    end;
end;

procedure TExcangerNakl.addNaklMoveRemoteToLocal(UnicumNum: integer);
begin
    try
      AppDataLocal.Connection.StartTransaction;
        getNaklDetailRemote(UnicumNum);
        AppDataRemote.OrdersMove.First;

       try
        if not AppDataRemote.OrdersMove.IsEmpty then
          Begin
            while not AppDataRemote.OrdersMove.Eof do
            Begin
              AppDataLocal.Command.Command.Execute(Format(SSQLAddOrdersMove ,[UnicumNum,
                                                                              AppDataRemote.OrdersMove.FieldByName('Article').AsString,
                                                                              AppDataRemote.OrdersMove.FieldByName('StrikeCode').AsString,
                                                                              AppDataRemote.OrdersMove.FieldByName('ProductName').AsString,
                                                                              AppDataRemote.OrdersMove.FieldByName('EDIN_IZMER').AsString,
                                                                              AppDataRemote.OrdersMove.FieldByName('Packages').AsString,
                                                                              AppDataRemote.OrdersMove.FieldByName('EDN_V_UPAK').AsString,
                                                                              AppDataRemote.OrdersMove.FieldByName('Qty').AsString,
                                                                              AppDataRemote.OrdersMove.FieldByName('Price').AsString,
                                                                              AppDataRemote.OrdersMove.FieldByName('Sum_Predm').AsString,
                                                                              AppDataRemote.OrdersMove.FieldByName('KON_KOLCH').AsString,
                                                                              AppDataRemote.OrdersMove.FieldByName('AuditStatus').AsInteger]));
              AppDataRemote.OrdersMove.Next;
            end;
          End;
       except
          AppDataLocal.Connection.Rollback;
       end;
    finally
      AppDataLocal.Connection.Commit;
    end;
end;

procedure TExcangerNakl.clearNaklHeadLocal;
begin
  try
    AppDataLocal.Connection.StartTransaction;
    try
      AppDataLocal.Command.Command.Execute(SSQLClearOrdersHeadLocal);  // очистит локальную БД от всех записей документов
    except
      AppDataLocal.Connection.Rollback;
    end;
  finally
    AppDataLocal.Connection.Commit;
  end;
end;

procedure TExcangerNakl.clearNaklMoveLocal;
begin
  try
    AppDataLocal.Connection.StartTransaction;
    try
       AppDataLocal.Command.Command.Execute(SSQLClearOrdersMoveLocal);  // очистит локальную БД от всех записей детализации документов
    except
       AppDataLocal.Connection.Rollback;
    end;
  finally
    AppDataLocal.Connection.Commit;
  end;
end;

procedure TExcangerNakl.clearProcessedDocLocal;
var
    pd: TProcessedDoc;
begin
  pd := TProcessedDoc.Create;

  try
     pd.Delete;     // Очистит локальную базу от всех записей отработанных документов
  finally
    pd.DisposeOf;
  end;
end;

constructor TExcangerNakl.Create(DBeg, DEnd: TDate; Reestr: string);
begin
  inherited Create;
  Self.BegD := DBeg;
  Self.EndD := DEnd;
  Self.Reestr := Reestr;
  AppDataRemote.ConnectToExternalDB();
end;

destructor TExcangerNakl.Destroy;
begin
  AppDataRemote.Connection.Connected := False;
  inherited;
end;

procedure TExcangerNakl.getNaklDetailLocal(UnicumNum: integer);
begin
  try
     AppDataLocal.OrdersMoveLoad.Active := False;
     AppDataLocal.OrdersMoveLoad.SQL.Text := Format(SSQLGetOrdersMove, [UnicumNum]);
     AppDataLocal.OrdersMoveLoad.Active := True;
  except
  end;
end;

procedure TExcangerNakl.getNaklDetailRemote(UnicumNum: integer);
begin
  try
      AppDataRemote.OrdersMove.Active := False;
      AppDataRemote.OrdersMove.SQL.Text := Format(SSQLGetPrintOrderDetails, [UnicumNum]);
      AppDataRemote.OrdersMove.Active := True;
  finally
  end;
end;

procedure TExcangerNakl.getNaklLocal(DBeg, DEnd: TDate; Build: smallint);
begin
  try
    AppDataLocal.OrdersHeadLoad.Active := False;

    AppDataLocal.OrdersHeadLoad.SQL.text := SSQLGetOrdersHeaderLocal + ' WHERE OrderDate BETWEEN ' +
                                            QuotedStr(FormatDateTime('yyyy-mm-dd', DBeg)) + ' AND ' +
                                            QuotedStr(FormatDateTime('yyyy-mm-dd', DEnd)) + ' AND ' +
                                            ' Status =  ' + Build.ToString;
    AppDataLocal.OrdersHeadLoad.Active := True;
  finally
  end;
end;

procedure TExcangerNakl.getNaklLocal(DBeg, DEnd: TDate);
begin
  try
    AppDataLocal.OrdersHeadLoad.Active := False;

    AppDataLocal.OrdersHeadLoad.SQL.Text := SSQLGetOrdersHeaderLocal + ' WHERE OrderDate BETWEEN ' +
                                            QuotedStr(FormatDateTime('yyyy-mm-dd', DBeg)) + ' AND ' +
                                            QuotedStr(FormatDateTime('yyyy-mm-dd', DEnd)) + ' AND ' +
                                            ' Status > 1 ';
    AppDataLocal.OrdersHeadLoad.Active := True;
  finally
  end;
end;

procedure TExcangerNakl.getNaklRemote(DBeg, DEnd: TDate; Reestr: string);
begin
    try
      AppDataRemote.OrdersHeader.Active := False;
      AppDataRemote.OrdersHeader.SQL.Text := Format(SSQLGetJournalOrders, [FormatDateTime('yyyy-mm-dd', DBeg),
                                                                           FormatDateTime('yyyy-mm-dd', DEnd),
                                                                           Reestr]);
      AppDataRemote.OrdersHeader.Active := True;
    finally
    end;
end;

procedure TExcangerNakl.pushNaklHeadLocalToRemote(UnicumNum: integer);
Begin
  //
end;

procedure TExcangerNakl.pushNaklHeadLocalToRemote;
  procedure getOrdersBuildNakl();
  Begin
    AppDataLocal.OrdersHeadLoad.Active := False;
    AppDataLocal.OrdersHeadLoad.SQL.Text := SSQLGetOrdersHeaderLocal + ' WHERE IfNull(H.Status, 0) > 1';
    AppDataLocal.OrdersHeadLoad.Active := True;
    AppDataLocal.OrdersHeadLoad.First;
  end;
begin
  getOrdersBuildNakl();

  if not AppDataLocal.OrdersHeadLoad.IsEmpty then
    try
      AppDataRemote.Connection.Transactions[0].StartTransaction;
      while not AppDataLocal.OrdersHeadLoad.Eof do
        try
           AppDataRemote.Command.SQL.Text := Format(SSQLLoadNaclAudit, [AppDataLocal.OrdersHeadLoad.FieldByName('FolioUID').AsInteger,
                                                                        AppDataLocal.OrdersHeadLoad.FieldByName('OrderUID').AsInteger,
                                                                        AppDataLocal.OrdersHeadLoad.FieldByName('OrderDate').AsString,
                                                                        AppDataLocal.OrdersHeadLoad.FieldByName('Status').AsInteger,
                                                                        CurrentUser.ID,
                                                                        AppDataLocal.OrdersHeadLoad.FieldByName('Date_Device').AsString]);
           AppDataRemote.Command.ExecSQL;
           pushNaklMoveLocalToRemote(AppDataLocal.OrdersHeadLoad.FieldByName('FolioUID').AsInteger);
           AppDataLocal.OrdersHeadLoad.Next;
        except
           AppDataRemote.Connection.Transactions[0].Rollback;
        end;
    finally
      AppDataRemote.Connection.Transactions[0].Commit;
    end;
end;

procedure TExcangerNakl.pushNaklMoveLocalToRemote(UnicumNum: integer);
  procedure getNaklDetail(UnicumNum: integer);
  Begin
    if UnicumNum > 0 then
      try
        AppDataLocal.OrdersMoveLoad.Active := False;
        AppDataLocal.OrdersMoveLoad.SQL.Text := Format(SSQLGetOrdersMove, [UnicumNum]) + ' AND Status = 1 ';
        AppDataLocal.OrdersMoveLoad.Active := True;    
      finally
        AppDataLocal.OrdersMoveLoad.First;  
      End;
  End;
begin
    getNaklDetail(UnicumNum);
    
    if not AppDataLocal.OrdersMoveLoad.IsEmpty then    
    try
      //AppDataRemote.Connection.Transactions[0].StartTransaction;
      while not AppDataLocal.OrdersMoveLoad.Eof do      
        try
          AppDataRemote.Command.SQL.Text := Format(SSQLLoadMoveAudit, [UnicumNum,
                                                                       AppDataLocal.OrdersHeadLoad.FieldByName('OrderUID').AsInteger,
                                                                       AppDataLocal.OrdersMoveLoad.FieldByName('Article').AsString,
                                                                       AppDataLocal.OrdersMoveLoad.FieldByName('StrikeCode').AsString,
                                                                       AppDataLocal.OrdersMoveLoad.FieldByName('Qty').AsString,
                                                                       AppDataLocal.OrdersMoveLoad.FieldByName('Status').AsInteger,
                                                                       CurrentUser.ID,
                                                                       AppDataLocal.OrdersMoveLoad.FieldByName('Date_Device').AsString]);
          AppDataRemote.Command.ExecSql; 
          AppDataLocal.OrdersMoveLoad.Next;        
        except
        end;
    finally
    end;
end;

procedure TExcangerNakl.pushProcessedDocLocalToRemote;
  procedure getProcessedDoc();
  Begin
    try
      AppDataLocal.ProcessedDocLoad.Active := False;
      AppDataLocal.ProcessedDocLoad.SQL.Text := SSQLGetCollectorOrdersOverride + ' WHERE Status = 3';
      AppDataLocal.ProcessedDocLoad.Active := True;
    except
      AppDataLocal.ProcessedDocLoad.Active := False;
    end;
  End;
begin
   getProcessedDoc();

   if (AppDataLocal.ProcessedDocLoad.Active) and
      (not AppDataLocal.ProcessedDocLoad.IsEmpty) then
    try
      AppDataRemote.Connection.Transactions[0].StartTransaction;

      try
        while not AppDataLocal.ProcessedDocLoad.Eof do
          Begin
            AppDataRemote.Command.SQL.Text := Format(SSQLInsProcessedDoc, [AppDataLocal.ProcessedDocLoad.FieldByName('FolioUID').AsString,
                                                                           AppDataLocal.ProcessedDocLoad.FieldByName('OrderDatePD').AsString,
                                                                           AppDataLocal.ProcessedDocLoad.FieldByName('Keeper').AsString,
                                                                           AppDataLocal.ProcessedDocLoad.FieldByName('KeeperUID').AsInteger,
                                                                           AppDataLocal.ProcessedDocLoad.FieldByName('Collector').AsString,
                                                                           AppDataLocal.ProcessedDocLoad.FieldByName('CollectorUID').AsInteger,
                                                                           AppDataLocal.ProcessedDocLoad.FieldByName('OrderBuildDate').AsString,
                                                                           AppDataLocal.ProcessedDocLoad.FieldByName('Status').AsInteger]);
           AppDataRemote.Command.ExecSQL;
           AppDataLocal.ProcessedDocLoad.Next;
          end;
      except
        AppDataRemote.Connection.Transactions[0].Rollback;
      end;
    finally
      AppDataRemote.Connection.Transactions[0].Commit;
    end;
end;

procedure TExcangerNakl.pushProcessedDocLocalToRemote(BegD, EndD: TDate);
  procedure getProcessedDoc(BegD, EndD: TDate);
  Begin
    try
      AppDataLocal.ProcessedDocLoad.Active := False;
      AppDataLocal.ProcessedDocLoad.SQL.Text := SSQLGetCollectorOrdersOverride + ' WHERE ' + FormatDateTime('yyyy-mm-dd', BegD) +
                                                                                  ' AND ' + FormatDateTime('yyyy-mm-dd', EndD) + ' AND ' +
                                                                                  ' Status = 3 ';
      AppDataLocal.ProcessedDocLoad.Active := True;
    except
      AppDataLocal.ProcessedDocLoad.Active := False;
    end;
  End;
begin
   getProcessedDoc(BegD, EndD);

   if (AppDataLocal.ProcessedDocLoad.Active) and
      (not AppDataLocal.ProcessedDocLoad.IsEmpty) then
    try
      AppDataRemote.Connection.Transactions[0].StartTransaction;

      try
        while not AppDataLocal.ProcessedDocLoad.Eof do
          Begin
            AppDataRemote.Command.SQL.Text := Format(SSQLInsProcessedDoc, [AppDataLocal.ProcessedDocLoad.FieldByName('FolioUID').AsString,
                                                                           AppDataLocal.ProcessedDocLoad.FieldByName('OrderDatePD').AsString,
                                                                           AppDataLocal.ProcessedDocLoad.FieldByName('Keeper').AsString,
                                                                           AppDataLocal.ProcessedDocLoad.FieldByName('KeeperUID').AsInteger,
                                                                           AppDataLocal.ProcessedDocLoad.FieldByName('Collector').AsString,
                                                                           AppDataLocal.ProcessedDocLoad.FieldByName('CollectorUID').AsInteger,
                                                                           AppDataLocal.ProcessedDocLoad.FieldByName('OrderBuildDate').AsString,
                                                                           AppDataLocal.ProcessedDocLoad.FieldByName('Status').AsInteger]);
           AppDataRemote.Command.ExecSQL;
           AppDataLocal.ProcessedDocLoad.Next;
          end;
      except
        AppDataRemote.Connection.Transactions[0].Rollback;
      end;
    finally
      AppDataRemote.Connection.Transactions[0].Commit;
    end;
end;

procedure TExcangerNakl.SetBegD(const Value: TDate);
begin
  FBegD := Value;
end;

procedure TExcangerNakl.SetEndD(const Value: TDate);
begin
  FEndD := Value;
end;

procedure TExcangerNakl.SetReestr(const Value: string);
begin
  FReestr := Value;
end;

procedure TExcangerNakl.start;
begin
    // Сначала отправить обработанные наклданые на уделнный сервер
    // После очистить таблицы с шапками и деталями накладных
    // Потом получить с удаленного сервера документы с детализацией
    pushNaklHeadLocalToRemote();
    pushProcessedDocLocalToRemote();
    clearNaklHeadLocal();
    clearNaklMoveLocal();
    clearProcessedDocLocal();
    addNaklHeadRemoteToLocal();
end;

end.
