unit Orders;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.TabControl, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.Objects, System.ImageList, FMX.ImgList, FMX.Ani;

type
  TOrdersForm = class(TForm)
    MainLayout: TLayout;
    OrdersHeaderTB: TToolBar;
    OrdersHeaderLbl: TLabel;
    PrevTabBtn: TButton;
    NextTabBtn: TButton;
    TabsOrder: TTabControl;
    OrdersTab: TTabItem;
    StatistTab: TTabItem;
    SynchTab: TTabItem;
    NaklLayout: TLayout;
    NaklHeaderTB: TToolBar;
    RefreshNaklBtn: TButton;
    RightNaklMenuBtn: TButton;
    NaklHeaderLbl: TLabel;
    NaklLV: TListView;
    NaklRigthMenuLayout: TLayout;
    ViewNaklBtn: TSpeedButton;
    IL: TImageList;
    BuildNaklBtn: TSpeedButton;
    SettingFilterBtn: TSpeedButton;
    RightMenuVCLayout: TLayout;
    NaklRightMenuFA: TFloatAnimation;
    NaklRigthMenuRect: TRoundRect;
    procedure RightNaklMenuBtnClick(Sender: TObject);
  private
    { Private declarations }
    procedure PanelNaklRightMenuView();
    procedure PanelNaklRightMenuHide();
  public
    { Public declarations }
  end;

var
  OrdersForm: TOrdersForm;

implementation

{$R *.fmx}

{ TOrdersForm }

procedure TOrdersForm.PanelNaklRightMenuHide;
begin
   NaklRigthMenuLayout.Visible := False;
   NaklRightMenuFA.Inverse := False;
   NaklRightMenuFA.Start;
end;

procedure TOrdersForm.PanelNaklRightMenuView;
begin
  NaklRigthMenuLayout.Height := Self.Height + 30;
  NaklRigthMenuLayout.Visible := True;

  NaklRightMenuFA.Inverse := False;
  NaklRightMenuFA.StartValue := Self.Height + 30;
  NaklRightMenuFA.Start;
end;

procedure TOrdersForm.RightNaklMenuBtnClick(Sender: TObject);
begin
  PanelNaklRightMenuView();
end;

end.
