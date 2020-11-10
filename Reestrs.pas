unit Reestrs;

interface

uses Globals, Interfaces, ModuleDataLocal, SConsts, System.SysUtils;

type
  TReestrs = class(TInterfacedObject, IInterfaceMove)

  public
    procedure Add; overload;
    procedure Add(UID: integer; Name: string); overload;
    procedure Delete;
    procedure Get;

   constructor Create();
  end;

implementation

{ TReestrs }

uses ModuleDataRemote;


procedure TReestrs.Add;
begin
   //DONE -opmp: Добавить список реестров из удаленного репозитория

   try
    if not AppDataRemote.Connection.Connected then
      AppDataRemote.ConnectToExternalDB;

    if AppDataRemote.Connection.Connected then
      Begin
        AppDataRemote.Reestrs.Active := False;
        AppDataRemote.Reestrs.SQL.Text := SSQLGetReestrs;
        AppDataRemote.Reestrs.Active := True;

        if not AppDataRemote.Reestrs.IsEmpty then
          try
             AppDataLocal.Connection.StartTransaction;
             Delete();

             AppDataRemote.Reestrs.First;
             while not AppDataRemote.Reestrs.Eof do
              try
                  Add(AppDataRemote.ReestrsUID.AsInteger, AppDataRemote.ReestrsProjectName.AsString);
                  AppDataRemote.Reestrs.Next;
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

procedure TReestrs.Add(UID: integer; Name: string);
begin
  AppDataLocal.Connection.StartTransaction;
  try
    try
      AppDataLocal.Command.Command.Execute(Format(SSQLAddReestrs, [UID,
                                                                   Name]));
    except
      AppDataLocal.Connection.Rollback;
    end;
  finally
    AppDataLocal.Connection.Commit;
  end;
end;

constructor TReestrs.Create;
begin
  inherited Create;
  Get();
end;

procedure TReestrs.Delete;
begin
  AppDataLocal.Connection.StartTransaction;
  try
    try
       AppDataLocal.Command.Command.Execute(SSQLDeleteReestrs);
    except
       AppDataLocal.Connection.Rollback;
    end;
  finally
    AppDataLocal.Connection.Commit;
  end;
end;

procedure TReestrs.Get;
begin
  try
    AppDataLocal.Reestrs.Active := False;
    AppDataLocal.Reestrs.Active := True;
  except
    AppDataLocal.Reestrs.Active := False;
  end;
end;


end.
