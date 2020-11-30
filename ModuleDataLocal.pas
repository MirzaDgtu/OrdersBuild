unit ModuleDataLocal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.UI, System.IOUtils,
  System.Notification;

type
  TAppDataLocal = class(TDataModule)
    Connection: TFDConnection;
    SQLiteDriver: TFDPhysSQLiteDriverLink;
    GUIxWaitCursor: TFDGUIxWaitCursor;
    Command: TFDQuery;
    EveryOne: TFDQuery;
    Reestrs: TFDQuery;
    ReestrsUID: TIntegerField;
    ReestrsProjectName: TStringField;
    ReestrsScreen: TBlobField;
    Brieforgs: TFDQuery;
    BrieforgsBrieforg: TStringField;
    BrieforgsScreen: TBlobField;
    Drivers: TFDQuery;
    DriversL_CP2_PLAT: TStringField;
    DriversScreen: TBlobField;
    Agents: TFDQuery;
    AgentsL_CP1_PLAT: TStringField;
    AgentsScreen: TBlobField;
    VidDocs: TFDQuery;
    VidDocsVID_DOC: TStringField;
    VidDocsScreen: TBlobField;
    CollectorBuild: TFDQuery;
    CollectorBuildDocKol: TIntegerField;
    CollectorBuildScreen: TBlobField;
    CollectorOrders: TFDQuery;
    CollectorOrdersUID: TIntegerField;
    CollectorOrdersFolioUID: TFloatField;
    CollectorOrdersKeeper: TStringField;
    CollectorOrdersKeeperUID: TIntegerField;
    CollectorOrdersCollector: TStringField;
    CollectorOrdersCollectorUID: TIntegerField;
    CollectorOrdersScreen: TBlobField;
    CollectorBuildCollectorUID: TIntegerField;
    CollectorBuildCollector: TStringField;
    CollectorOrdersOrderBuildDate: TWideMemoField;
    OrdersMove: TFDQuery;
    OrdersHead: TFDQuery;
    OrdersMoveFolioUID: TIntegerField;
    OrdersMoveArticle: TStringField;
    OrdersMoveStrikeCode: TStringField;
    OrdersMoveProductName: TStringField;
    OrdersMovePackages: TFloatField;
    OrdersMoveEDIN_IZMER: TStringField;
    OrdersMoveEDN_V_UPAK: TFloatField;
    OrdersMoveQty: TFloatField;
    OrdersMovePrice: TFloatField;
    OrdersMoveSum_Predm: TFloatField;
    OrdersMoveKON_KOLCH: TFloatField;
    OrdersMoveStatus: TIntegerField;
    OrdersMoveDate_Device: TWideMemoField;
    OrdersHeadUID: TIntegerField;
    OrdersHeadJournalNo: TIntegerField;
    OrdersHeadOrderUID: TIntegerField;
    OrdersHeadFolioUID: TFloatField;
    OrdersHeadOrderNo: TFloatField;
    OrdersHeadOrderDate: TWideMemoField;
    OrdersHeadBRIEFORG: TStringField;
    OrdersHeadORGANIZNKL: TStringField;
    OrdersHeadL_CP1_PLAT: TStringField;
    OrdersHeadL_CP2_PLAT: TStringField;
    OrdersHeadVID_DOC: TStringField;
    OrdersHeadSUM_ROZN: TFloatField;
    OrdersHeadSUM_POR: TFloatField;
    OrdersHeadStrikeCode: TStringField;
    OrdersHeadNAMEP_USER: TStringField;
    OrdersHeadADRES_USER: TStringField;
    OrdersHeadProjectName: TStringField;
    OrdersHeadColProd: TSmallintField;
    OrdersHeadColBuildProd: TSmallintField;
    OrdersHeadScreen: TBlobField;
    OrdersHeadDate_Device: TLargeintField;
    Collectors: TFDQuery;
    CollectorsUID: TIntegerField;
    CollectorsName: TStringField;
    CollectorsScreen: TBlobField;
    OrdersMoveScreen: TBlobField;
    OrdersHeadStatus: TIntegerField;
    OrdersHeadCollectorUID: TIntegerField;
    OrdersHeadCollector: TStringField;
    OrdersHeadKeeperUID: TIntegerField;
    OrdersHeadKeeper: TStringField;
    CollectorOrdersOrderDatePD: TWideMemoField;
    OrdersMoveLoad: TFDQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField1: TFloatField;
    StringField4: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    IntegerField2: TIntegerField;
    WideMemoField1: TWideMemoField;
    BlobField1: TBlobField;
    OrdersHeadLoad: TFDQuery;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    WideMemoField2: TWideMemoField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    SmallintField1: TSmallintField;
    SmallintField2: TSmallintField;
    BlobField2: TBlobField;
    LargeintField1: TLargeintField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    StringField14: TStringField;
    IntegerField8: TIntegerField;
    StringField15: TStringField;
    Users: TFDQuery;
    UsersID: TIntegerField;
    UsersUserLogin: TStringField;
    UsersUserName: TStringField;
    UsersLastUser: TSmallintField;
    UsersScreen: TBlobField;
    UsersLastUserScreen: TBlobField;
    NTFC: TNotificationCenter;
    ProcessedDocLoad: TFDQuery;
    IntegerField9: TIntegerField;
    FloatField11: TFloatField;
    StringField16: TStringField;
    IntegerField10: TIntegerField;
    StringField17: TStringField;
    IntegerField11: TIntegerField;
    ProcessedDocLoadStatus: TIntegerField;
    ProcessedDocLoadOrderBuildDate: TDateTimeField;
    ProcessedDocLoadOrderDatePD: TDateTimeField;
    KeeperAccess: TFDQuery;
    KeeperAccessKeeperUID: TIntegerField;
    KeeperAccessKeeperName: TStringField;
    KeeperAccessCollectorUID: TIntegerField;
    KeeperAccessCollectorName: TStringField;
    KeeperAccessScreen: TBlobField;
    procedure ConnectionBeforeConnect(Sender: TObject);
    procedure BrieforgsBeforeOpen(DataSet: TDataSet);
    procedure DriversBeforeOpen(DataSet: TDataSet);
    procedure AgentsBeforeOpen(DataSet: TDataSet);
    procedure VidDocsBeforeOpen(DataSet: TDataSet);
    procedure ReestrsBeforeOpen(DataSet: TDataSet);
    procedure CollectorsBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function ConnectionToLocalDB: Boolean;

    constructor Create(AOwner: TComponent); override;
  end;

var
  AppDataLocal: TAppDataLocal;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses SConsts;

{$R *.dfm}

{ TAppDataLocal }

procedure TAppDataLocal.AgentsBeforeOpen(DataSet: TDataSet);
begin
  Agents.SQL.Text := SSQLGetAgentsLocal;
end;

procedure TAppDataLocal.BrieforgsBeforeOpen(DataSet: TDataSet);
begin
   Brieforgs.SQL.Text := SSQLGetBrieforgLocal;
end;

procedure TAppDataLocal.CollectorsBeforeOpen(DataSet: TDataSet);
begin
  Collectors.SQL.Text := SSQLGetCollectors;
end;

procedure TAppDataLocal.ConnectionBeforeConnect(Sender: TObject);
begin
    {$IFDEF ANDROID}
        Connection.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'SqlLiteBase.db');
    {$ENDIF}

    {$IFDEF MSWINDOWS}
        Connection.Params.Values['DataBase'] := ExtractFilePath(ParamStr(0)) + 'SqlLiteBase.db';
    {$ENDIF}
end;

function TAppDataLocal.ConnectionToLocalDB: Boolean;
begin
     try
      Connection.Connected := True;
   except
      Connection.Connected := False;
   end;

    Result := Connection.Connected;
end;

constructor TAppDataLocal.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ConnectionToLocalDB();
end;

procedure TAppDataLocal.DriversBeforeOpen(DataSet: TDataSet);
begin
  Drivers.SQL.Text := SSQLGetDriversLocal;
end;

procedure TAppDataLocal.ReestrsBeforeOpen(DataSet: TDataSet);
begin
   Reestrs.SQL.Text := SSQLGetReestrsLocal;
end;

procedure TAppDataLocal.VidDocsBeforeOpen(DataSet: TDataSet);
begin
  VidDocs.SQL.Text := SSQLGetVidDocLocal;
end;

end.
