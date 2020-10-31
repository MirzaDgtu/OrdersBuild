unit Globals;

interface

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
var
    CurrentUser: TUser;
    ConnectLocal: TConnectLocal;
    FilterLocal: TFilter;
    DatesLocal: TDates;
    NaklRec: TNaklRec;
    CollectorNakl: TNaklCollector;
    ProdNakl: TProdNakl;


implementation



end.
