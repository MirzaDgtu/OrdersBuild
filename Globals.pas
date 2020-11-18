unit Globals;

interface
uses WifiConnect;

type
  TUser = record
    ID: integer;
    Login: string;
    Name: string;
  end;

type
  TConnectLocal = record
    Sever: string;
    InitialCatalog: string;
    login: string;
    Password: string;
    Port: integer;
  end;

type
  TFilter = record
    JournalNo: string;
    DBeg: TDate;
    DEnd: TDate;
    Reestr: string;
    Brieforg: string;
    VidDoc: string;
    Driver: string;
    Agent: string;
    BuildStr: string;
  end;

type
  TDates = record
    DBeg: TDate;
    DEnd: TDate;
  end;

type
  TNaklRec = record
    UnicumNum: integer;
    NumDoc: integer;
    JournalNo: integer;
    BRIEFORG: string;
    ORGANIZNKL: string;
    L_CP1_PLAT: string;
    L_CP2_PLAT: string;
    VID_DOC: string;
    SUM_ROZN: string;
    SUM_POR: string;
    StrikeCode: string;
    NAMEP_USER: string;
    ADRES_USER: string;
    ProjectName: string;
    Date_Device: string;
    KolProd: integer;
    KolBuildProd: integer;
    Status: integer;
    CollectorUID: integer;
    Collector: string;
    OrderDate: string;
  end;

type
  TNaklCollector = record
    UID: integer;
    Name: string;
  end;

type
  TProdNakl = record
    Article: integer;
    Name : string;
  end;

type
  TStatistNakl = record
    CollectorUID: integer;
    CollectorName: string;
    CollectNaklCount: integer;
  end;
var
    CurrentUser: TUser;
    ConnectLocal: TConnectLocal;
    FilterLocal: TFilter;
    DatesLocal: TDates;
    NaklRec: TNaklRec;
    CollectorNakl: TNaklCollector;
    ProdNakl: TProdNakl;
    StatistNakl: TStatistNakl;
  {$IFDEF ANDOID}
    wifiConnect1: TWifiConnect;
  {$ENDIF}


implementation




end.
