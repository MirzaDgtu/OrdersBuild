unit Collectors;

interface

uses Interfaces, ModuleDataLocal, SConsts, Globals, System.SysUtils;

type
  TCollectors = class(TInterfacedObject, IInterfaceMove)

  public
    procedure Add; overload;
    procedure Add(UID: integer; Name: string); overload;
    procedure Delete;
    procedure Get;


    constructor Create();
  end;

implementation

{ TCollectors }

uses ModuleDataRemote;

procedure TCollectors.Add;
begin
//DONE -opmp: Обновить список сборщиков с удаленного репозитория
  if not AppDataRemote.Connection.Connected then
    AppDataRemote.ConnectToExternalDB();

  try
    if AppDataRemote.Connection.Connected then
      Begin
        AppDataRemote.Collectors.Active := False;
        AppDataRemote.Collectors.SQL.Text := SSQLGetCollectorsOrdersBuild;
        AppDataRemote.Collectors.Active := True;

        if not AppDataRemote.Collectors.IsEmpty then
          try
            AppDataLocal.Connection.StartTransaction;
            try
               Delete(); // Очистка списка сборщиков из локальной базы

               AppDataRemote.Collectors.First;
               AppDataLocal.Connection.StartTransaction;
               while not AppDataRemote.Collectors.Eof do
                Begin
                  Add(AppDataRemote.CollectorsUID.AsInteger, AppDataRemote.CollectorsEmployeeName.AsString);
                  AppDataRemote.Collectors.Next();
                End;
            except
              AppDataLocal.Connection.Rollback;
            end;
          finally
            AppDataLocal.Connection.Commit;
          end;
      End;
  finally
    AppDataRemote.Connection.Connected := False;
  end;
end;

procedure TCollectors.Add(UID: integer; Name: string);
begin
  try
  AppDataLocal.Connection.StartTransaction;
    try
      AppDataLocal.Command.Command.Execute(Format(SSQLAddCollectorLocal, [UID,
                                                                          Name]));
    except
      AppDataLocal.Connection.Rollback;
    end;
  finally
    AppDataLocal.Connection.Commit;
  end;
end;

constructor TCollectors.Create;
begin
   inherited Create();
   Get();
end;

procedure TCollectors.Delete;
begin
  try
  AppDataLocal.Connection.StartTransaction;
    try
      AppDataLocal.Command.Command.Execute(SSQlDeleteCollectors);
    except
      AppDataLocal.Connection.Rollback;
    end;
  finally
    AppDataLocal.Connection.Commit;
  end;
end;

procedure TCollectors.Get;
begin
  try
    AppDataLocal.Collectors.Active := False;
    AppDataLocal.Collectors.SQL.Text := SSQLGetCollectors;
    AppDataLocal.Collectors.Active := True;
  finally
  end;
end;

end.
