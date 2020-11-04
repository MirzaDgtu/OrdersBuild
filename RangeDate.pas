unit RangeDate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.DateTimeCtrls, FMX.ListBox;

type
  TRangeForm = class(TForm)
    MainLayout: TLayout;
    RangeHeaderTB: TToolBar;
    BackRangeBtn: TButton;
    SaveRangeBtn: TButton;
    RangeHeadLbl: TLabel;
    CenterRangeLayout: TLayout;
    RangeLB: TListBox;
    RangeLBGH: TListBoxGroupHeader;
    BegDLBI: TListBoxItem;
    EndDLBI: TListBoxItem;
    BegDE: TDateEdit;
    EndDE: TDateEdit;
    procedure SaveRangeBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BegDEChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(BegD, EndD: TDate); overload;
  end;

var
  RangeForm: TRangeForm;

implementation

{$R *.fmx}

uses Globals;
{$R *.XLgXhdpiTb.fmx ANDROID}

{ TRangeForm }

procedure TRangeForm.BegDEChange(Sender: TObject);
begin
  if BegDE.Date > EndDE.Date then
     EndDE.Date := BegDE.Date;
end;

constructor TRangeForm.Create(BegD, EndD: TDate);
begin
  inherited Create(Application);
  BegDE.Date := BegD;
  EndDE.Date := EndD;
end;

procedure TRangeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {$IFDEF ANDROID}
    Action := TCloseAction.caFree;
  {$ENDIF}
end;

procedure TRangeForm.SaveRangeBtnClick(Sender: TObject);
begin
  DatesLocal.DBeg := BegDE.Date;
  DatesLocal.DEnd := EndDE.Date;
  ModalResult := mrOk;
end;

end.
