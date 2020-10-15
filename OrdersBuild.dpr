program OrdersBuild;

uses
  System.StartUpCopy,
  FMX.Forms,
  Sign in 'Sign.pas' {SignForm},
  ModuleDataLocal in 'ModuleDataLocal.pas' {AppDataLocal: TDataModule},
  SConsts in 'SConsts.pas',
  Users in 'Users.pas',
  Globals in 'Globals.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TSignForm, SignForm);
  Application.Run;
end.
