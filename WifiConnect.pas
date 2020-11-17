
unit WifiConnect;

interface

//{$IFDEF ANDOId}
uses
    Androidapi.Helpers, Androidapi.jni.JavaTypes, FMX.Helpers.android, Androidapi.jni.GraphicsContentViewText,
    Androidapi.jni.App, Androidapi.jni.Net, Androidapi.jni.Location, Androidapi.JNIBridge, System.android.Notification,
    Androidapi.jni.Provider;



type
  TWifiConnect = class
  private
    FSupplicant: Boolean;
    FEnabled: Boolean;
    FState: Integer;
    FSpeed: Integer;
    FIP: Integer;
    FSupplicantState: string;
    procedure SetEnabled(const Value: Boolean);
    procedure SetIP(const Value: Integer);
    procedure SetSpeed(const Value: Integer);
    procedure SetState(const Value: Integer);
    procedure SetSupplicant(const Value: Boolean);
    procedure SetSupplicantState(const Value: string);


    public
       function ConnectToWifi(State: Boolean): Boolean;
       procedure OpenSettingWifi();
       function getCheckConnectWifi(): Boolean;

    published
      property Enabled: Boolean read FEnabled write SetEnabled;
      property State: Integer read FState write SetState;
      property Supplicant: Boolean read FSupplicant write SetSupplicant;
      property IP: Integer read FIP write SetIP;
      property Speed: Integer read FSpeed write SetSpeed;
      property SupplicantState: string read FSupplicantState write SetSupplicantState;

    constructor Create();
  end;
//{$ENDIF}

implementation


//{$IFDEF ANDOId}


uses Globals;
{ TWifiConnect }

function TWifiConnect.ConnectToWifi(State: Boolean): Boolean;
var
  WifiSN: JWifiManager;
begin
  try
    try
      WifiSN := TJWifiManager.Wrap(TAndroidHelper.Context.getSystemService(TJContext.JavaClass.WIFI_SERVICE));
      Result := WifiSN.setWifiEnabled(State);
    except
      Result := False;
    end;
  finally
    getCheckConnectWifi();
    Result := WifiSN.isWifiEnabled;
  end;
end;

constructor TWifiConnect.Create;
begin
  inherited Create();

    try
      Enabled := False;
      State := -1;
      Supplicant := False;
      IP := 0;
      Speed := -1;
      SupplicantState := 'DISCONNECTED';
    finally
    end
end;

function TWifiConnect.getCheckConnectWifi: Boolean;
var
  WifiManagerObj: JObject;
  WifiManager: JWifiManager;
  WifiInfo: JWifiInfo;
begin

  WifiManagerObj := SharedActivityContext.getSystemService(TJContext.JavaClass.WIFI_SERVICE);
  WifiManager := TJWifiManager.Wrap((WifiManagerObj as ILocalObject).GetObjectID);
  WifiInfo := WifiManager.getConnectionInfo();

    try
      Enabled := WifiManager.isWifiEnabled;
      State := WifiManager.getWifiState;
      Supplicant := WifiManager.pingSupplicant;
      IP := WifiInfo.getIpAddress;
      Speed := WifiInfo.getLinkSpeed;
      SupplicantState := JStringToString(WifiInfo.getSupplicantState.toString);
    finally
        if (Enabled = True) and
           (Ip > 0) and
           (State > 2) and
           (SupplicantState = 'COMPLETED') then
            Result := True
        else
            Result := False;
    end
end;

procedure TWifiConnect.OpenSettingWifi;
var
    intent: JIntent;
    WifiSN: JWifiManager;
begin
  try
    WifiSN := TJWifiManager.Wrap(TAndroidHelper.Context.getSystemService(TJContext.JavaClass.WIFI_SERVICE));

    intent := TJIntent.Create;
    intent := TJIntent.JavaClass.init(TJSettings.JavaClass.ACTION_WIFI_SETTINGS);
    TAndroidHelper.Activity.startActivity(intent);
  finally
    getCheckConnectWifi();
  end;
end;

procedure TWifiConnect.SetEnabled(const Value: Boolean);
begin
  FEnabled := Value;
end;

procedure TWifiConnect.SetIP(const Value: Integer);
begin
  FIP := Value;
end;

procedure TWifiConnect.SetSpeed(const Value: Integer);
begin
  FSpeed := Value;
end;

procedure TWifiConnect.SetState(const Value: Integer);
begin
  FState := Value;
end;

procedure TWifiConnect.SetSupplicant(const Value: Boolean);
begin
  FSupplicant := Value;
end;
procedure TWifiConnect.SetSupplicantState(const Value: string);
begin
  FSupplicantState := Value;
end;

//{$ENDIF}
end.
