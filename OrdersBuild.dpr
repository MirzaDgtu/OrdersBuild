program OrdersBuild;

uses
  System.StartUpCopy,
  FMX.Forms,
  Sign in 'Sign.pas' {SignForm},
  ModuleDataLocal in 'ModuleDataLocal.pas' {AppDataLocal: TDataModule},
  SConsts in 'SConsts.pas',
  Users in 'Users.pas',
  Globals in 'Globals.pas',
  DataBaseLocal in 'DataBaseLocal.pas',
  ConnectRemove in 'ConnectRemove.pas',
  Orders in 'Orders.pas' {OrdersForm},
  Interfaces in 'Interfaces.pas',
  Reestrs in 'Reestrs.pas',
  Statist in 'Statist.pas',
  Nakl in 'Nakl.pas' {NaklForm},
  NaklAct in 'NaklAct.pas',
  Collectors in 'Collectors.pas',
  ProcessedDoc in 'ProcessedDoc.pas',
  ModuleDataRemote in 'ModuleDataRemote.pas' {AppDataRemote: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TSignForm, SignForm);
  Application.CreateForm(TAppDataRemote, AppDataRemote);
  Application.Run;
end.
