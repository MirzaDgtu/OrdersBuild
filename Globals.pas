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

var
    CurrentUser: TUser;
    ConnectLocal: TConnectLocal;

implementation

end.
