program OrdersBuild;

uses
  System.StartUpCopy,
  FMX.Forms,
  Sign in 'Sign.pas' {SignForm},
  ModuleDataLocal in 'ModuleDataLocal.pas' {AppDataLocal: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TSignForm, SignForm);
  Application.CreateForm(TAppDataLocal, AppDataLocal);
  Application.Run;
end.
