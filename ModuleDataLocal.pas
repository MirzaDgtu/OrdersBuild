unit ModuleDataLocal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.UI;

type
  TAppDataLocal = class(TDataModule)
    Connection: TFDConnection;
    SQLiteDriver: TFDPhysSQLiteDriverLink;
    GUIxWaitCursor: TFDGUIxWaitCursor;
    Users: TFDQuery;
    UsersID: TIntegerField;
    UsersUserLogin: TStringField;
    UsersUserName: TStringField;
    UsersLastUser: TSmallintField;
    UsersScreen: TBlobField;
    Command: TFDQuery;
    EveryOne: TFDQuery;
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

{$R *.dfm}

{ TAppDataLocal }

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
  inherited;
  ConnectionToLocalDB();
end;

end.
