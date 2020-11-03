unit ModuleDataRemote;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, Uni, UniProvider,
  SQLServerUniProvider;

type
  TAppDataRemote = class(TDataModule)
    SQLServerProvider: TSQLServerUniProvider;
    Connection: TUniConnection;
    Command: TUniQuery;
    Users: TUniQuery;
    UsersUID: TIntegerField;
    UsersProjectUID: TIntegerField;
    UsersCategoryUID: TIntegerField;
    UsersEmployeeName: TStringField;
    UsersJobPhone: TStringField;
    UsersHomePhone: TStringField;
    UsersAddress: TStringField;
    UsersAvailable: TBooleanField;
    UsersfName: TStringField;
    UserspName: TStringField;
    UserssName: TStringField;
    UsersDocument: TStringField;
    UsersRegionUID: TIntegerField;
    UsersEssieiUID: TIntegerField;
    OrdersHeader: TUniQuery;
    fldUID: TIntegerField;
    fldJournalNo: TIntegerField;
    fldOrderUID: TIntegerField;
    fldFolioUID: TFloatField;
    fldOrderNo: TFloatField;
    fldOrderDate: TDateField;
    fldStatus: TIntegerField;
    fldDone: TBooleanField;
    fldPrintCount: TIntegerField;
    fldClientCode: TStringField;
    fldClientName: TStringField;
    fldAgent: TStringField;
    fldDriver: TStringField;
    fldMarker: TStringField;
    OrdersHeaderSUM_ROZN: TFloatField;
    OrdersHeaderSUM_POR: TFloatField;
    OrdersHeaderStrikeCode: TStringField;
    OrdersHeaderNAMEP_USER: TStringField;
    OrdersHeaderReestrName: TStringField;
    OrdersHeaderProjectName: TStringField;
    OrdersHeaderCodeSborPos: TStringField;
    OrdersHeaderADRES_USER: TStringField;
    OrdersHeaderAuditStatus: TIntegerField;
    OrdersHeaderDATE_DEVICE: TStringField;
    OrdersMove: TUniQuery;
    OrdersMoveRecNo: TFloatField;
    OrdersMoveArticle: TStringField;
    OrdersMoveProductName: TStringField;
    OrdersMoveCODE_EDIN_IZMER: TStringField;
    OrdersMoveEDIN_IZMER: TStringField;
    OrdersMoveEDN_V_UPAK: TFloatField;
    OrdersMovePackages: TFloatField;
    OrdersMoveQty: TFloatField;
    OrdersMoveSUM_PREDM: TFloatField;
    OrdersMoveSUM_ROZN: TFloatField;
    OrdersMoveNALOGMONEY: TFloatField;
    OrdersMoveNoTaxSum: TFloatField;
    OrdersMoveTax10: TFloatField;
    OrdersMoveTax18: TFloatField;
    OrdersMoveNDS: TFloatField;
    OrdersMovePrice: TFloatField;
    OrdersMoveFactPrice: TFloatField;
    OrdersMoveNoTaxPrice: TFloatField;
    OrdersMoveCODE_COUNTRY: TStringField;
    OrdersMoveCOUNTRY: TStringField;
    OrdersMoveS100: TStringField;
    OrdersMoveS200: TStringField;
    OrdersMoveS250: TStringField;
    OrdersMoveS255: TStringField;
    OrdersMoveNACENKA: TFloatField;
    OrdersMoveWeight: TFloatField;
    OrdersMoveStrikeCode: TStringField;
    OrdersMoveDATE2: TDateField;
    OrdersMoveDATE1: TDateField;
    OrdersMoveStartDate: TDateField;
    OrdersMoveFinalDate: TDateField;
    OrdersMoveKON_KOLCH: TFloatField;
    OrdersMoveAuditStatus: TIntegerField;
    Reestrs: TUniQuery;
    ReestrsUID: TIntegerField;
    ReestrsProjectName: TStringField;
    Collectors: TUniQuery;
    CollectorsUID: TIntegerField;
    CollectorsName: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function ConnectToExternalDB: Boolean;
  end;

var
  AppDataRemote: TAppDataRemote;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses Globals, SConsts;

{$R *.dfm}

{ TAppDataRemote }

function TAppDataRemote.ConnectToExternalDB: Boolean;
begin
   try
    with Connection do
      Begin
        Connected := False;

        ProviderName := 'SQL Server';
        Server := ConnectLocal.Sever;
        Database := ConnectLocal.InitialCatalog;
        Username := ConnectLocal.login;
        Password := ConnectLocal.Password;
        Port :=ConnectLocal.Port ;
        LoginPrompt := False;

        Connected := True;
      End;
   except
     Result := False;
   end;

   Result := Connection.Connected;
end;

end.
