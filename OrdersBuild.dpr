program OrdersBuild;

uses
  System.StartUpCopy,
  FMX.Forms,
  Sign in 'Sign.pas' {SignForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TSignForm, SignForm);
  Application.Run;
end.
