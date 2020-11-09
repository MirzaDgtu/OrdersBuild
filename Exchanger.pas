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

    procedure addNaklHeadRemoteToLocal();                       // Добавление документов в локальную БД полученных с удаленного сервера
    procedure addNaklMoveRemoteToLocal(UnicumNum: integer);     // Добавление деталихцаии документа в локальную БД полученных с уделенного сервера

    procedure pushNaklHeadLocalToRemote(); overload;                   // Отправление собранных документов с локальной БД на удаленный сервер
    procedure pushNaklHeadLocalToRemote(UnicumNum: integer); overload; // Отправление собранного документа с локальной БД на удаленный сервер
    procedure pushNaklMoveLocalToRemote(UnicumNum: integer);           // Отправление детализации документа с локальной БД на удаленный сервер

    procedure start();

    constructor Create(DBeg, DEnd: TDate; Reestr: string); overload;
    destructor  Destroy(); override;

   published
     property BegD: TDate read FBegD write SetBegD;
     property EndD: TDate read FEndD write SetEndD;
     property Reestr: string read FReestr write SetReestr;
  end;

implementation

uses SConsts, Globals, ModuleDataLocal, ModuleDataRemote;

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
begin
    //
end;

procedure TExcangerNakl.pushNaklHeadLocalToRemote;
begin
  //
end;

procedure TExcangerNakl.pushNaklMoveLocalToRemote(UnicumNum: integer);
begin
    //
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

    clearNaklHeadLocal();
    clearNaklMoveLocal();
    addNaklHeadRemoteToLocal();
end;

end.
