unit Orders;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.TabControl, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.Objects, System.ImageList, FMX.ImgList, FMX.Ani, FMX.ListBox, FMX.Edit,
  FMX.DateTimeCtrls, FMX.EditBox, FMX.SpinBox;

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
    FilterSettingLayout: TLayout;
    FilterSettingRect: TRectangle;
    FilterSettingFA: TFloatAnimation;
    FilterSettingHeaderTB: TToolBar;
    BackFilterSettingBtn: TButton;
    RefreshFilterSettingBtn: TButton;
    Label7: TLabel;
    FilterSettingLB: TListBox;
    JournalNumLBI: TListBoxItem;
    JournalSpin: TSpinBox;
    DateBetweenLBGH: TListBoxGroupHeader;
    BegDateLBI: TListBoxItem;
    BegDate: TDateEdit;
    EndDateLBI: TListBoxItem;
    EndDate: TDateEdit;
    ParamLNGH: TListBoxGroupHeader;
    ReestrLBI: TListBoxItem;
    ReestrFilterSettingBtn: TButton;
    ReestrFilterSettingEdit: TEdit;
    ClearEditButton2: TClearEditButton;
    BrieforgLBI: TListBoxItem;
    BrieforgFilterSettingBtn: TButton;
    BrieforgFilterSettingEdit: TEdit;
    ClearEditButton3: TClearEditButton;
    VidDocLBI: TListBoxItem;
    VidDocFilterSettingBtn: TButton;
    VidDocFilterSettingEdit: TEdit;
    ClearEditButton4: TClearEditButton;
    DriverLBI: TListBoxItem;
    DriverFilterSettingBtn: TButton;
    DriverFilterSettingEdit: TEdit;
    ClearEditButton5: TClearEditButton;
    AgentLBI: TListBoxItem;
    AgentFilterSettingBtn: TButton;
    AgentFilterSettingEdit: TEdit;
    ClearEditButton6: TClearEditButton;
    BuildLBI: TListBoxItem;
    TypeBuildCombo: TComboBox;
    procedure RightNaklMenuBtnClick(Sender: TObject);
    procedure SettingFilterBtnClick(Sender: TObject);
    procedure NaklLVClick(Sender: TObject);
  private
    { Private declarations }
    procedure PanelNaklRightMenuView();
    procedure PanelNaklRightMenuHide();
    procedure PanelSettingFilterView();
    procedure PanelSettingFilterHide();


  public
    { Public declarations }
  end;

var
  OrdersForm: TOrdersForm;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.XLgXhdpiTb.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}

{ TOrdersForm }

procedure TOrdersForm.NaklLVClick(Sender: TObject);
begin
   PanelNaklRightMenuHide();
end;

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

procedure TOrdersForm.PanelSettingFilterHide;
begin
   FilterSettingLayout.Visible := False;
   FilterSettingFA.Inverse := False;
   FilterSettingFA.Start;
end;

procedure TOrdersForm.PanelSettingFilterView;
begin
  FilterSettingLayout.Height := Self.Height + 30;
  FilterSettingLayout.Visible := True;

  FilterSettingFA.Inverse := False;
  FilterSettingFA.StartValue := Self.Height + 30;
  FilterSettingFA.Start;
end;

procedure TOrdersForm.RightNaklMenuBtnClick(Sender: TObject);
begin
  PanelNaklRightMenuView();
end;

procedure TOrdersForm.SettingFilterBtnClick(Sender: TObject);
begin
   PanelNaklRightMenuHide();
   PanelSettingFilterView();
end;

end.
