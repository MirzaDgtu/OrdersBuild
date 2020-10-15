unit Sign;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, System.ImageList, FMX.ImgList, FMX.Controls.Presentation,
  FMX.Edit, FMX.ListBox, FMX.Objects;

type
  TSignForm = class(TForm)
    MainLayout: TLayout;
    SignHeaderTB: TToolBar;
    SignBottomTB: TToolBar;
    Images: TImageList;
    SettingParamSBtn: TSpeedButton;
    SignHeadeLbl: TLabel;
    SignSBtn: TSpeedButton;
    DefaultSBtn: TSpeedButton;
    AOuthRect: TRectangle;
    AOuthLB: TListBox;
    SignLBGH: TListBoxGroupHeader;
    ServerLBI: TListBoxItem;
    UserLBI: TListBoxItem;
    ServerEdit: TEdit;
    ClearServerEditBtn: TClearEditButton;
    UserEdit: TEdit;
    UserBtn: TButton;
    ClearUserEditBtn: TClearEditButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SignForm: TSignForm;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.XLgXhdpiTb.fmx ANDROID}

end.
