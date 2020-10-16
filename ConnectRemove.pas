unit ConnectRemove;

interface
uses Globals;

type
  TConnectRemove = class
    private
    public
      procedure Get(out ConnectLocal: TConnectLocal);
      procedure Add(Server, InitialCatalog, Login, Password: string; Port: Int16);

      constructor Create(out ConnectLocal: TConnectLocal); overload; override;
  end;

implementation

uses ModuleDataLocal, SConsts;

{ TConnectRemove }

procedure TConnectRemove.Add(Server, InitialCatalog, Login, Password: string;
  Port: Int16);
begin

end;

constructor TConnectRemove.Create(out ConnectLocal: TConnectLocal);
begin
  inherited;
  Get(ConnectLocal);
end;

procedure TConnectRemove.Get(out ConnectLocal: TConnectLocal);
begin

end;

end.
