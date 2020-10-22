unit Orders;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.TabControl, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.Objects, System.ImageList, FMX.ImgList, FMX.Ani, FMX.ListBox, FMX.Edit,
  FMX.DateTimeCtrls, FMX.EditBox, FMX.SpinBox, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

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
    SaveFilterSettingBtn: TButton;
    SettingFilterLbl: TLabel;
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
    ReestrLayout: TLayout;
    ReestrRect: TRectangle;
    ReestrsHeaderTB: TToolBar;
    BackReestrFilterSettingBtn: TButton;
    RefreshReestrFilterSettingBtn: TButton;
    ReestrFilterSettingHeaderLbl: TLabel;
    ReestrFilterSettingFA: TFloatAnimation;
    ReestrsLV: TListView;
    ReestrBS: TBindSourceDB;
    OrdersBL: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    ReestrsFA: TFloatAnimation;
    BrieforgLayout: TLayout;
    BrieforgRect: TRectangle;
    BrieforgFA: TFloatAnimation;
    BrieforgHeaderTB: TToolBar;
    BackBrieforgBtn: TButton;
    RefreshBrieforgBtn: TButton;
    BrieforgHeaderLbl: TLabel;
    BrieforgLV: TListView;
    BrieforgBS: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    DriversLayout: TLayout;
    DriversRect: TRectangle;
    DriversHeaderTB: TToolBar;
    BackDriversBtn: TButton;
    RefreshDriversBtn: TButton;
    DriversHeaderLbl: TLabel;
    DriversFA: TFloatAnimation;
    DriversLV: TListView;
    DriversBS: TBindSourceDB;
    LinkListControlToField3: TLinkListControlToField;
    AgentsLayout: TLayout;
    AgentsRect: TRectangle;
    AgentsHeaderTB: TToolBar;
    BackAgentsBtn: TButton;
    RefreshAgentsBtn: TButton;
    AgentsHeaderLbl: TLabel;
    AgentsLV: TListView;
    AgentsBS: TBindSourceDB;
    LinkListControlToField4: TLinkListControlToField;
    AgentsFA: TFloatAnimation;
    VidDocsLayout: TLayout;
    VidDocsHeaderTB: TToolBar;
    BackVidDocsBtn: TButton;
    RefreshVidDocsBtn: TButton;
    VidDocsHeaderLbl: TLabel;
    VidDocsFA: TFloatAnimation;
    VidDocsRect: TRectangle;
    VidDocsLV: TListView;
    VidDocsBS: TBindSourceDB;
    LinkListControlToField5: TLinkListControlToField;
    StatistLayout: TLayout;
    StatistBottomTB: TToolBar;
    RefreshStatistBtn: TButton;
    RightStatistMenuBtn: TButton;
    StatistBottomLbl: TLabel;
    StatistLV: TListView;
    RightStatistMenuLayout: TLayout;
    RightStatistMenuRect: TRoundRect;
    LoaderNaklBtn: TButton;
    RightStatistRectLayout: TLayout;
    RangeStatistBtn: TButton;
    RefreshStatistMenuBtn: TButton;
    RightStatistMenuFA: TFloatAnimation;
    SynchLayout: TLayout;
    SynchLB: TListBox;
    SynchRect: TRectangle;
    SynchBottomTB: TToolBar;
    SynchBtn: TSpeedButton;
    Label1: TLabel;
    SynchParamLBGH: TListBoxGroupHeader;
    DBegSynchLBI: TListBoxItem;
    DEndSynchLBI: TListBoxItem;
    ReestrSynchLBI: TListBoxItem;
    DBegSynchEdit: TDateEdit;
    DEndSynchEdit: TDateEdit;
    RightReestrPanel: TPanel;
    ReestrSynchBtn: TButton;
    ReestrSynchEdit: TEdit;
    LinkListControlToField6: TLinkListControlToField;
    CollectorBuild: TBindSourceDB;
    procedure RightNaklMenuBtnClick(Sender: TObject);
    procedure SettingFilterBtnClick(Sender: TObject);
    procedure NaklLVClick(Sender: TObject);
    procedure BackFilterSettingBtnClick(Sender: TObject);
    procedure SaveFilterSettingBtnClick(Sender: TObject);
    procedure PrevTabBtnClick(Sender: TObject);
    procedure NextTabBtnClick(Sender: TObject);
    procedure ReestrsLVItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ReestrFilterSettingBtnClick(Sender: TObject);
    procedure BackReestrFilterSettingBtnClick(Sender: TObject);
    procedure BrieforgFilterSettingBtnClick(Sender: TObject);
    procedure BackBrieforgBtnClick(Sender: TObject);
    procedure RefreshBrieforgBtnClick(Sender: TObject);
    procedure BrieforgLVItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure BackDriversBtnClick(Sender: TObject);
    procedure DriversLVItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure RefreshAgentsBtnClick(Sender: TObject);
    procedure AgentsLVItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure BackVidDocsBtnClick(Sender: TObject);
    procedure RefreshVidDocsBtnClick(Sender: TObject);
    procedure VidDocsLVItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure VidDocFilterSettingBtnClick(Sender: TObject);
    procedure DriverFilterSettingBtnClick(Sender: TObject);
    procedure RefreshDriversBtnClick(Sender: TObject);
    procedure AgentFilterSettingBtnClick(Sender: TObject);
    procedure BackAgentsBtnClick(Sender: TObject);
    procedure RightStatistMenuBtnClick(Sender: TObject);
    procedure StatistLVClick(Sender: TObject);
    procedure ReestrSynchBtnClick(Sender: TObject);
    procedure RefreshStatistBtnClick(Sender: TObject);
    procedure DBegSynchEditChange(Sender: TObject);
  private
    { Private declarations }
    procedure PanelView(LayoutName: TLayout; FA: TFloatAnimation);
    procedure PanelHide(LayoutName: TLayout; FA: TFloatAnimation);
    procedure PanelAllHide();

    procedure setFilterSettingRecord();
    procedure setGlobalDates(DBegP, DEndP: TDate);

    procedure correctDP();

  public
    { Public declarations }
  end;

var
  OrdersForm: TOrdersForm;

implementation

{$R *.fmx}
{$R *.XLgXhdpiTb.fmx ANDROID}

uses ModuleDataLocal, SConsts, Globals, Reestrs, Interfaces;
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.XLgXhdpiTb.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}

{ TOrdersForm }

procedure TOrdersForm.AgentFilterSettingBtnClick(Sender: TObject);
begin
   RefreshAgentsBtnClick(Self);
   PanelView(AgentsLayout, AgentsFA);
end;

procedure TOrdersForm.AgentsLVItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
    FilterLocal.Agent := AItem.Data['L_CP1_PLAT'].AsString;
    AgentFilterSettingEdit.Text := AItem.Data['L_CP1_PLAT'].AsString;
    PanelHide(AgentsLayout, AgentsFA);
end;

procedure TOrdersForm.BackAgentsBtnClick(Sender: TObject);
begin
  PanelHide(AgentsLayout, AgentsFA);
end;

procedure TOrdersForm.BackBrieforgBtnClick(Sender: TObject);
begin
  PanelHide(BrieforgLayout, BrieforgFA);
end;

procedure TOrdersForm.BackDriversBtnClick(Sender: TObject);
begin
  PanelHide(DriversLayout, DriversFA);
end;

procedure TOrdersForm.BackFilterSettingBtnClick(Sender: TObject);
begin
  PanelHide(FilterSettingLayout, FilterSettingFA);
end;

procedure TOrdersForm.BackReestrFilterSettingBtnClick(Sender: TObject);
begin
  PanelHide(ReestrLayout, ReestrsFA);
end;

procedure TOrdersForm.BackVidDocsBtnClick(Sender: TObject);
begin
  PanelHide(VidDocsLayout, VidDocsFA);
end;

procedure TOrdersForm.BrieforgFilterSettingBtnClick(Sender: TObject);
begin
  BrieforgBS.DataSet.Active := False;
  BrieforgBS.DataSet.Active := True;
  PanelView(BrieforgLayout, BrieforgFA);
end;

procedure TOrdersForm.BrieforgLVItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  FilterLocal.Brieforg := AItem.Data['Brieforg'].AsString;
  BrieforgFilterSettingEdit.Text := AItem.Data['Brieforg'].AsString;
  PanelHide(BrieforgLayout, BrieforgFA);
end;

procedure TOrdersForm.correctDP;
begin
    if (DBegSynchEdit.Date  > DEndSynchEdit.Date) then
         DEndSynchEdit.Date := DBegSynchEdit.Date;
    if (BegDate.Date > EndDate.Date) then
         EndDate.Date := BegDate.Date;

    setGlobalDates(DBegSynchEdit.Date, DEndSynchEdit.Date);
end;

procedure TOrdersForm.DBegSynchEditChange(Sender: TObject);
begin
   correctDP();
end;

procedure TOrdersForm.DriverFilterSettingBtnClick(Sender: TObject);
begin
   RefreshDriversBtnClick(Self);
   PanelView(DriversLayout, DriversFA);
end;

procedure TOrdersForm.DriversLVItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  FilterLocal.Driver := AItem.Data['L_CP2_PLAT'].AsString;
  DriverFilterSettingEdit.Text := AItem.Data['L_CP2_PLAT'].AsString;
  PanelHide(DriversLayout, DriversFA);
end;

procedure TOrdersForm.NaklLVClick(Sender: TObject);
begin
   PanelHide(NaklRigthMenuLayout, NaklRightMenuFA);
end;

procedure TOrdersForm.NextTabBtnClick(Sender: TObject);
begin
  PanelAllHide();
  TabsOrder.Next();
end;

procedure TOrdersForm.PanelAllHide;
begin
  PanelHide(RightStatistMenuLayout, RightStatistMenuFA);
  PanelHide(NaklRigthMenuLayout, NaklRightMenuFA);
  PanelHide(ReestrLayout, ReestrsFA);
end;

procedure TOrdersForm.PanelHide(LayoutName: TLayout; FA: TFloatAnimation);
begin
   LayoutName.Visible := False;
   FA.Inverse := False;
   FA.Start;
end;

procedure TOrdersForm.PanelView(LayoutName: TLayout; FA: TFloatAnimation);
begin
  LayoutName.Height := Self.Height + 30;
  LayoutName.Visible := True;

  FA.Inverse := False;
  FA.StartValue := Self.Height + 30;
  FA.Start;
end;

procedure TOrdersForm.PrevTabBtnClick(Sender: TObject);
begin
  PanelAllHide();
  TabsOrder.Previous();
end;

procedure TOrdersForm.ReestrFilterSettingBtnClick(Sender: TObject);
var
    reestrsI: IInterfaceMove;
begin

  try
    ReestrLayout.Parent := OrdersTab;
    reestrsI := TReestrs.Create;
    PanelView(ReestrLayout, ReestrsFA);
  finally
  end;
end;

procedure TOrdersForm.ReestrsLVItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
   PanelHide(ReestrLayout, ReestrsFA);
   FilterLocal.Reestr := AItem.Data['ProjectName'].AsString;

   ReestrFilterSettingEdit.Text := AItem.Data['ProjectName'].AsString;
   ReestrSynchEdit.Text := AItem.Data['ProjectName'].AsString;

  { case TabsOrder.TabIndex of
    0 : ReestrFilterSettingEdit.Text := AItem.Data['ProjectName'].AsString;
    2 : ReestrSynchEdit.Text := AItem.Data['ProjectName'].AsString;
   end; }
end;

procedure TOrdersForm.ReestrSynchBtnClick(Sender: TObject);
var
   reestrsI: IInterfaceMove;
begin

  try
  ReestrLayout.Parent := SynchTab;
    reestrsI := TReestrs.Create;
    PanelView(ReestrLayout, ReestrsFA);
  finally
  end;
end;

procedure TOrdersForm.RefreshAgentsBtnClick(Sender: TObject);
begin
  try
     AgentsBS.DataSet.Active := False;
     AgentsBS.DataSet.Active := True;
  except
  end;
end;

procedure TOrdersForm.RefreshBrieforgBtnClick(Sender: TObject);
begin
  try
    BrieforgBS.DataSet.Active := False;
    BrieforgBS.DataSet.Active := True;
  finally
  end;
end;

procedure TOrdersForm.RefreshDriversBtnClick(Sender: TObject);
begin
   DriversBS.DataSet.Active := False;
   DriversBS.DataSet.Active := True;
end;

procedure TOrdersForm.RefreshStatistBtnClick(Sender: TObject);
begin
  try
    AppDataLocal.CollectorBuild.Active := False;
    AppDataLocal.CollectorBuild.SQL.Text := Format(SSQLGetCollectCountOrders, [FormatDateTime('yyyy-mm-dd', BegDate.Date),
                                                                               FormatDateTime('yyyy-mm-dd', EndDate.Date)]);
    AppDataLocal.CollectorBuild.Active := True;
  except
  end;
end;

procedure TOrdersForm.RefreshVidDocsBtnClick(Sender: TObject);
begin
  VidDocsBS.DataSet.Active := False;
  VidDocsBS.DataSet.Active := True;
end;

procedure TOrdersForm.RightNaklMenuBtnClick(Sender: TObject);
begin
  PanelView(NaklRigthMenuLayout, NaklRightMenuFA);
end;

procedure TOrdersForm.RightStatistMenuBtnClick(Sender: TObject);
begin
  PanelView(RightStatistMenuLayout,  RightStatistMenuFA);
end;

procedure TOrdersForm.SaveFilterSettingBtnClick(Sender: TObject);
begin
  PanelHide(FilterSettingLayout, FilterSettingFA);
  setFilterSettingRecord();
end;

procedure TOrdersForm.setFilterSettingRecord;
begin
  try
    FilterLocal.JournalNo := ((JournalSpin.Value).ToString);
    FilterLocal.DBeg := BegDate.Date;
    FilterLocal.DEnd := EndDate.Date;
    FilterLocal.Reestr := ReestrFilterSettingEdit.Text;
    FilterLocal.Brieforg := BrieforgFilterSettingEdit.Text;
    FilterLocal.VidDoc := VidDocFilterSettingEdit.Text;
    FilterLocal.Driver := DriverFilterSettingEdit.Text;
    FilterLocal.Agent := AgentFilterSettingEdit.Text;
    FilterLocal.BuildStr := TypeBuildCombo.Items.Text;
  except
     FillChar(FilterLocal, SizeOf(TFilter), #0);
  end;
end;

procedure TOrdersForm.setGlobalDates(DBegP, DEndP: TDate);
begin
    DatesLocal.DBeg := DBegP;
    DatesLocal.DEnd := DEndP;
end;

procedure TOrdersForm.SettingFilterBtnClick(Sender: TObject);
begin
   PanelHide(NaklRigthMenuLayout, NaklRightMenuFA);
   PanelView(FilterSettingLayout, FilterSettingFA);
end;

procedure TOrdersForm.StatistLVClick(Sender: TObject);
begin
  PanelHide(RightStatistMenuLayout,  RightStatistMenuFA);
end;

procedure TOrdersForm.VidDocFilterSettingBtnClick(Sender: TObject);
begin
  RefreshVidDocsBtnClick(Self);
  PanelView(VidDocsLayout, VidDocsFA);
end;

procedure TOrdersForm.VidDocsLVItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  FilterLocal.VidDoc := AItem.Data['VID_DOC'].AsString;
  VidDocFilterSettingEdit.Text := AItem.Data['VID_DOC'].AsString;
  PanelHide(VidDocsLayout, VidDocsFA);
end;

end.
