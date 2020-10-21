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

var
    CurrentUser: TUser;
    ConnectLocal: TConnectLocal;
    FilterLocal: TFilter;

implementation

end.
