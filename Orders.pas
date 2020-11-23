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
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, System.StrUtils,
  System.Threading, System.SyncObjs, System.Generics.Collections, FMX.Gestures,
  System.Notification, FMX.DialogService, FMX.SearchBox, FMX.VirtualKeyboard, FMX.Platform,
  FMX.Media;

type
  TListViewSearchHelper = class helper for TListView
    public
      function SearchBox: TSearchBox;
  end;

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
    NaklDetailBtn: TSpeedButton;
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
    OrdersHeaderBS: TBindSourceDB;
    LinkListControlToField7: TLinkListControlToField;
    OrdersBottomSB: TStatusBar;
    OrdersBottomGPL: TGridPanelLayout;
    KolDocLbl: TLabel;
    KolBuildDocLbl: TLabel;
    StatistNaklLayout: TLayout;
    StatistNaklFA: TFloatAnimation;
    StatistNaklHeaderTB: TToolBar;
    BackStatistNaklBtn: TButton;
    RefreshStatistNaklBtn: TButton;
    NameStatistNaklHeadLbl: TLabel;
    BottomStatistNaklSB: TStatusBar;
    RectStatistNakl: TRectangle;
    DocKolSBInfoLbl: TLabel;
    StatistNalkLV: TListView;
    StatistNaklBS: TBindSourceDB;
    LinkListControlToField8: TLinkListControlToField;
    GM: TGestureManager;
    IL32: TImageList;
    NaklDetailLayout: TLayout;
    NaklDetailHaederTB: TToolBar;
    BackNaklDetailBtn: TButton;
    RefreshNaklDetailBtn: TButton;
    NaklDetailHeadLbl: TLabel;
    NaklDetailRect: TRectangle;
    NaklDetailLB: TListBox;
    NaklDetailLBGH: TListBoxGroupHeader;
    NumDocNaklDetailLBi: TListBoxItem;
    JournalNaklDetailLBi: TListBoxItem;
    BrieforgNaklDetailLBi: TListBoxItem;
    OrganizaklNaklDetailLBi: TListBoxItem;
    TypeOperNaklDetailLBi: TListBoxItem;
    DriverNaklDetailLBi: TListBoxItem;
    AgentNaklDetailLBi: TListBoxItem;
    SummaFactNaklDetailLBi: TListBoxItem;
    SummaRoznNaklDetailLBi: TListBoxItem;
    StatusNaklDetailLBi: TListBoxItem;
    NumDocNaklDetailLBl: TLabel;
    JournalNaklDetailLBl: TLabel;
    BrieforgNaklDetailLBl: TLabel;
    OrganizaklNaklDetailLBl: TLabel;
    TypeOperNaklDetailLBl: TLabel;
    DriverNaklDetailLBl: TLabel;
    AgentNaklDetailLBl: TLabel;
    SummaFactNaklDetailLBl: TLabel;
    SummaRoznNaklDetailLBl: TLabel;
    StatusNaklDetailLBl: TLabel;
    NaklDetailFA: TFloatAnimation;
    IndicateSynchLayout: TLayout;
    IndicateSynchRect: TRectangle;
    IndicateSynchPie: TPie;
    IndicateSynchVCLayout: TLayout;
    IndicateSynchCircle: TCircle;
    IndicateSynchText: TText;
    IndicateSynchLbl: TLabel;
    IL35: TImageList;
    ExitBtn: TSpeedButton;
    procedure RightNaklMenuBtnClick(Sender: TObject);
    procedure SettingFilterBtnClick(Sender: TObject);
    procedure NaklLVClick(Sender: TObject);
    procedure BackFilterSettingBtnClick(Sender: TObject);
    procedure SaveFilterSettingBtnClick(Sender: TObject);
    procedure PrevTabBtnClick(Sender: TObject);
    procedure NextTabBtnClick(Sender: TObject);
    procedure ReestrsLVItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure BackReestrFilterSettingBtnClick(Sender: TObject);
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
    procedure RefreshDriversBtnClick(Sender: TObject);
    procedure BackAgentsBtnClick(Sender: TObject);
    procedure RightStatistMenuBtnClick(Sender: TObject);
    procedure StatistLVClick(Sender: TObject);
    procedure ReestrSynchBtnClick(Sender: TObject);
    procedure RefreshStatistBtnClick(Sender: TObject);
    procedure DBegSynchEditChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshNaklBtnClick(Sender: TObject);
    procedure DEndSynchEditChange(Sender: TObject);
    procedure BegDateChange(Sender: TObject);
    procedure EndDateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NaklLVItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure BuildNaklBtnClick(Sender: TObject);
    procedure RefreshReestrFilterSettingBtnClick(Sender: TObject);
    procedure TabsOrderChange(Sender: TObject);
    procedure BackStatistNaklBtnClick(Sender: TObject);
    procedure StatistLVItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure LoaderNaklBtnClick(Sender: TObject);
    procedure RefreshStatistNaklBtnClick(Sender: TObject);
    procedure RangeStatistBtnClick(Sender: TObject);
    procedure SynchBtnClick(Sender: TObject);
    procedure NaklLVGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure StatistLVGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure SynchRectGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure TabsOrderGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure ReestrSynchEditClick(Sender: TObject);
    procedure ReestrFilterSettingEditClick(Sender: TObject);
    procedure BrieforgFilterSettingEditClick(Sender: TObject);
    procedure VidDocFilterSettingEditClick(Sender: TObject);
    procedure DriverFilterSettingEditClick(Sender: TObject);
    procedure AgentFilterSettingEditClick(Sender: TObject);
    procedure NaklDetailBtnClick(Sender: TObject);
    procedure BackNaklDetailBtnClick(Sender: TObject);
    procedure TypeBuildComboChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure NaklLVKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure ExitBtnClick(Sender: TObject);
  private
    { Private declarations }
    strReques: string;
    strRequesCountDoc: string;
    statusDocLoc: Byte;
    strSearchValue: string;

    procedure PanelView(LayoutName: TLayout; FA: TFloatAnimation);
    procedure PanelHide(LayoutName: TLayout; FA: TFloatAnimation);

    procedure PanelViewH(LayoutName: TLayout; FA: TFloatAnimation);
    procedure PanelHideH(LayoutName: TLayout; FA: TFloatAnimation);

    procedure PanelAllHide();

    procedure setFilterSettingRecord();
    procedure setGlobalDates(DBegP, DEndP: TDate);
    procedure setOrdersBottomSBInfo();
    procedure setActualDate();
    procedure setNaklDetail();
    procedure correctDP();
    procedure synchronizeToRemote();


  public
    { Public declarations }
  end;

var
  OrdersForm: TOrdersForm;

implementation

{$R *.fmx}

uses ModuleDataLocal, SConsts, Globals, Reestrs, Interfaces, Nakl, NaklAct,
  Statist, RangeDate, Exchanger, Sign, WifiConnect;

{ TOrdersForm }

procedure TOrdersForm.AgentFilterSettingEditClick(Sender: TObject);
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

procedure TOrdersForm.BackNaklDetailBtnClick(Sender: TObject);
begin
  PanelHideH(NaklDetailLayout, NaklDetailFA);
end;

procedure TOrdersForm.BackReestrFilterSettingBtnClick(Sender: TObject);
begin
  PanelHide(ReestrLayout, ReestrsFA);
end;

procedure TOrdersForm.BackStatistNaklBtnClick(Sender: TObject);
begin
  PanelHide(StatistNaklLayout, StatistNaklFA);
end;

procedure TOrdersForm.BackVidDocsBtnClick(Sender: TObject);
begin
  PanelHide(VidDocsLayout, VidDocsFA);
end;

procedure TOrdersForm.BegDateChange(Sender: TObject);
begin
  correctDP;
  DBegSynchEdit.Date := BegDate.Date;
end;

procedure TOrdersForm.BrieforgFilterSettingEditClick(Sender: TObject);
begin
  BrieforgBS.DataSet.Active := False;
  BrieforgBS.DataSet.Active := True;
  PanelView(BrieforgLayout, BrieforgFA);
end;

procedure TOrdersForm.BrieforgLVItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  FilterLocal.Brieforg := AItem.Data['BRIEFORG'].AsString;
  BrieforgFilterSettingEdit.Text := AItem.Data['BRIEFORG'].AsString;
  PanelHide(BrieforgLayout, BrieforgFA);
end;

procedure TOrdersForm.BuildNaklBtnClick(Sender: TObject);
var
    NaklF: TNaklForm;
    NaklAct: TNaklAction;
    iValMS: integer;
begin
   PanelHide(NaklRigthMenuLayout, NaklRightMenuFA);

   if NaklRec.UnicumNum > 0 then
     try
       NaklF := TNaklForm.Create(NaklRec.UnicumNum, NaklRec.NumDoc, NaklRec.KolProd,
                                 NaklRec.KolBuildProd, NaklRec.Status, NaklRec.CollectorUID, NaklRec.Collector);
       NaklAct := TNaklAction.Create(NaklRec.UnicumNum);



       {$IFDEF ANDROID}
          NaklF.ShowModal(
                          procedure (ModalResult: TModalResult)
                          var iVal: integer;
                              NaklAct: TNaklAction;
                          Begin

                            if ModalResult = mrOk then
                             try
                               TNaklAction.setMoveNaklDefault(NaklRec.UnicumNum);
                               NaklAct := TNaklAction.Create(NaklRec.UnicumNum);

                               if NaklF.FProdChecked.Count > 0 then
                                Begin
                                  for iVal in NaklF.FProdChecked do
                                     NaklAct.SaveBuildProd(NaklRec.UnicumNum, iVal, 1);
                                End
                               else
                                  TNaklAction.setMoveNaklDefault(NaklRec.UnicumNum);

                                TNaklAction.SaveHeadNakl(NaklRec.UnicumNum, NaklF.KolProdP, NaklF.FProdChecked.Count);
                             finally
                             end;
                          end
                          );
       {$ENDIF}

       {$IFDEF MSWINDOWS}
          if NaklF.ShowModal = mrOk then
            try
               if NaklF.FProdChecked.Count > 0 then
                  Begin
                   TNaklAction.setMoveNaklDefault(NaklRec.UnicumNum);
                    for iValMS in NaklF.FProdChecked do
                       NaklAct.SaveBuildProd(NaklF.UnicumNumP, iValMS, 1);
                  End
                else
                   TNaklAction.setMoveNaklDefault(NaklF.UnicumNumP);

                TNaklAction.SaveHeadNakl(NaklF.UnicumNumP, NaklF.KolProdP, NaklF.FProdChecked.Count);
            finally
            end;
       {$ENDIF}

     finally
      {$IFDEF MSWINDOWS}
        FreeAndNil(NaklF);
      {$ENDIF}
       FreeAndNil(NaklAct);
       RefreshNaklBtnClick(Self);
     end;
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
   BegDate.Date := DBegSynchEdit.Date;
end;

procedure TOrdersForm.DEndSynchEditChange(Sender: TObject);
begin
  correctDP();
  EndDate.Date := DEndSynchEdit.Date;
end;

procedure TOrdersForm.DriverFilterSettingEditClick(Sender: TObject);
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

procedure TOrdersForm.EndDateChange(Sender: TObject);
begin
  correctDP();
  DEndSynchEdit.Date := EndDate.Date;
end;

procedure TOrdersForm.ExitBtnClick(Sender: TObject);
begin
  Close();
end;

procedure TOrdersForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {$IFDEF ANDROID}
    Action := TCloseAction.caFree;
  {$ENDIF}
end;

procedure TOrdersForm.FormCreate(Sender: TObject);
begin
  setActualDate();
end;

procedure TOrdersForm.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  Focused := Self.OrdersTab;
  strSearchValue := strSearchValue + KeyChar;

  if Key = 13 then
    Begin
      case TabsOrder.Index of
        0: Begin
            NaklLV.SearchBox.Text := EmptyStr;
            if Length(strSearchValue) > 0 then
              Begin
                NaklLV.SearchBox.Text := Copy(strSearchValue, 3, Length(strSearchValue));
                strSearchValue := EmptyStr;
              End;
           End;

        1: Begin
            StatistLV.SearchBox.Text := EmptyStr;
            if Length(strSearchValue) > 0 then
             Begin
              StatistLV.SearchBox.Text := Copy(strSearchValue, 3, Length(strSearchValue));
              strSearchValue := EmptyStr;
             End;

           End;
      end;
    End;
end;

procedure TOrdersForm.LoaderNaklBtnClick(Sender: TObject);
begin
  PanelHide(RightStatistMenuLayout, RightStatistMenuFA);
  TStatist.Get(StatistNakl.CollectorUID);
  NameStatistNaklHeadLbl.Text := StatistNakl.CollectorName;
  DocKolSBInfoLbl.Text := Format('Документов: %d', [StatistNakl.CollectNaklCount]);
  PanelView(StatistNaklLayout, StatistNaklFA);
end;

procedure TOrdersForm.NaklDetailBtnClick(Sender: TObject);
begin
  setNaklDetail();
  PanelHide(NaklRigthMenuLayout, NaklRightMenuFA);
  PanelViewH(NaklDetailLayout, NaklDetailFA);
end;

procedure TOrdersForm.NaklLVClick(Sender: TObject);
var
   KeyboardService: IFMXVirtualKeyboardService;
begin
   PanelHide(NaklRigthMenuLayout, NaklRightMenuFA);
   if TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(KeyboardService)) then
        KeyboardService.HideVirtualKeyboard;
end;

procedure TOrdersForm.NaklLVGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  TabsOrder.OnGesture(Sender, EventInfo, Handled);
end;

procedure TOrdersForm.NaklLVItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin

   try
     NaklRec.UnicumNum := (AItem.Data['FolioUID'].AsString).toInteger;
     NaklRec.NumDoc := (AItem.Data['OrderNo'].AsString).toInteger;
     NaklRec.KolProd := (AItem.Data['ColProd'].AsString).toInteger;
     NaklRec.KolBuildProd := (AItem.Data['ColBuildProd'].AsString).toInteger;
     NaklRec.Status := (AItem.Data['Status'].AsString).toInteger;
     NaklRec.CollectorUID := (IFThen(AItem.Data['CollectorUID'].AsString = EmptyStr, '0', (AItem.Data['CollectorUID'].AsString))).ToInteger;
     NaklRec.Collector := AItem.Data['Collector'].AsString;
     NaklRec.OrderDate := AItem.Data['OrderDate'].AsString;
     NaklRec.JournalNo := (AItem.Data['JournalNo'].AsString).ToInteger;
     NaklRec.BRIEFORG  := AItem.Data['BRIEFORG'].AsString;
     NaklRec.ORGANIZNKL := AItem.Data['ORGANIZNKL'].AsString;
     NaklRec.L_CP1_PLAT := AItem.Data['L_CP1_PLAT'].AsString;
     NaklRec.L_CP2_PLAT := AItem.Data['L_CP2_PLAT'].AsString;
     NaklRec.VID_DOC    := AItem.Data['VID_DOC'].AsString;
     NaklRec.SUM_ROZN   := AItem.Data['SUM_ROZN'].AsString;
     NaklRec.SUM_POR    := AItem.Data['SUM_POR'].AsString;
     NaklRec.StrikeCode := AItem.Data['StrikeCode'].AsString;
     NaklRec.NAMEP_USER := AItem.Data['NAMEP_USER'].AsString;
     NaklRec.ADRES_USER := AItem.Data['ADRES_USER'].AsString;
     NaklRec.ProjectName := AItem.Data['ProjectName'].AsString;
   finally
     PanelHide(NaklRigthMenuLayout, NaklRightMenuFA);
   end;

end;

procedure TOrdersForm.NaklLVKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  Focused := Self.OrdersTab;
  strSearchValue := strSearchValue + KeyChar;
  if Key = 13 then
    Begin
      NaklLV.SearchBox.Text := EmptyStr;
      if Length(strSearchValue) > 0 then
        Begin
          NaklLV.SearchBox.Text := Copy(strSearchValue, 3, Length(strSearchValue));
          strSearchValue := EmptyStr;
        End;
    End;
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
  PanelHide(FilterSettingLayout, FilterSettingFA);
end;

procedure TOrdersForm.PanelHide(LayoutName: TLayout; FA: TFloatAnimation);
begin
   LayoutName.Visible := False;
   FA.Inverse := False;
   FA.Start;
end;

procedure TOrdersForm.PanelHideH(LayoutName: TLayout; FA: TFloatAnimation);
begin
  try
    FA.Inverse := True;
    FA.StartValue := Self.Width;
    FA.Start;
  finally
    LayoutName.Visible := False;
  end;
end;

procedure TOrdersForm.PanelView(LayoutName: TLayout; FA: TFloatAnimation);
begin
  LayoutName.Height := Self.Height + 30;
  LayoutName.Visible := True;

  FA.Inverse := False;
  FA.StartValue := Self.Height + 30;
  FA.Start;
end;

procedure TOrdersForm.PanelViewH(LayoutName: TLayout; FA: TFloatAnimation);
begin
  try
    LayoutName.Width := Self.Width;
    LayoutName.Visible := True;

    FA.Inverse := False;
    FA.StartValue := Self.Width;
  finally
    FA.Start;
  end;
end;

procedure TOrdersForm.PrevTabBtnClick(Sender: TObject);
begin
  PanelAllHide();
  TabsOrder.Previous();
end;

procedure TOrdersForm.RangeStatistBtnClick(Sender: TObject);
var
  rangeFD: TRangeForm;
begin
  rangeFD := TRangeForm.Create(DatesLocal.DBeg, DatesLocal.DEnd);
  PanelHide(RightStatistMenuLayout, RightStatistMenuFA);

  try
     {$IFDEF ANDROID}
           rangeFD.ShowModal(
                             procedure(ModalResult: TModalResult)
                             Begin
                               if ModalResult = mrOk then
                                 Begin
                                    BegDate.Date := DatesLocal.DBeg;
                                    EndDate.Date := DatesLocal.DEnd;
                                 end;
                             end);
     {$ENDIF}


     {$IFDEF MSWINDOWS}
        if rangeFD.ShowModal = mrOk then
          Begin
            BegDate.Date := DatesLocal.DBeg;
            EndDate.Date := DatesLocal.DEnd;
          End;
     {$ENDIF}
  finally
    {$IFDEF MSWINDOWS}
       FreeAndNil(rangeFD);
    {$ENDIF}

    //DONE -opmp: Доделать обновление списка статистики при изменении промежутка дат
    RefreshStatistBtnClick(Self);
  end;
end;

procedure TOrdersForm.ReestrFilterSettingEditClick(Sender: TObject);
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

procedure TOrdersForm.ReestrSynchEditClick(Sender: TObject);
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
  except
  end;
end;

procedure TOrdersForm.RefreshDriversBtnClick(Sender: TObject);
begin
  try
   DriversBS.DataSet.Active := False;
   DriversBS.DataSet.Active := True;
  except
  end;
end;

procedure TOrdersForm.RefreshNaklBtnClick(Sender: TObject);
begin

  try
    if statusDocLoc = 0 then
       try
        statusDocLoc := 1;
        if strReques.IsEmpty then
             strReques := SSQLGetOrdersHeaderLocal + ' WHERE OrderDate BETWEEN ' +
                          QuotedStr(FormatDateTime('yyyy-mm-dd', FilterLocal.DBeg)) + ' AND ' +
                          QuotedStr(FormatDateTime('yyyy-mm-dd', FilterLocal.DEnd));

        AppDataLocal.OrdersHead.Active := False;
        AppDataLocal.OrdersHead.SQL.Text := strReques;
        AppDataLocal.OrdersHead.Active := True;
        statusDocLoc := 0;
       finally
         setOrdersBottomSBInfo();
       end
    else
      ShowMessage('Процесс получения документов еще завершен!' + #13 + 'Пожалуйста подождите');
  except
    on Err: Exception do
      Begin
        statusDocLoc := 0;
        ShowMessage('Ошибка получения документов!' + #13 + 'Сообщение: ' + Err.Message);
      End;
  end;
end;

procedure TOrdersForm.RefreshReestrFilterSettingBtnClick(Sender: TObject);
var
    reestr: TReestrs;
begin
  reestr := TReestrs.Create();

  try
    reestr.Add();
  finally
    reestr.Get();
  end;
end;

procedure TOrdersForm.RefreshStatistBtnClick(Sender: TObject);
var
    stat: TStatist;
begin
  stat := TStatist.Create();
  try
    stat.Get;
  except
  end;
end;

procedure TOrdersForm.RefreshStatistNaklBtnClick(Sender: TObject);
begin
  TStatist.Get(StatistNakl.CollectorUID);
end;

procedure TOrdersForm.RefreshVidDocsBtnClick(Sender: TObject);
begin
  try
    VidDocsBS.DataSet.Active := False;
    VidDocsBS.DataSet.Active := True;
  except
  end;
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

procedure TOrdersForm.setActualDate;
begin
  try
    BegDate.Date := Now();
    EndDate.Date := BegDate.Date + 1;
    FilterLocal.DBeg := BegDate.Date;
    FilterLocal.DEnd := EndDate.Date;

    if NaklLV.SearchBox <> nil then
      Begin
        NaklLV.SearchBox.TextSettings.FontColor := TAlphaColorRec.Red;
        NaklLV.SearchBox.TextSettings.HorzAlign := TTextAlign.Center;
        NaklLV.SearchBox.StyledSettings := NaklLV.SearchBox.StyledSettings - [TStyledSetting.FontColor];
      End;

  except
  end;
end;

procedure TOrdersForm.setFilterSettingRecord;
begin
  strReques := EmptyStr;
  strRequesCountDoc := EmptyStr;

  try
    try
      FilterLocal.JournalNo := IfThen(JournalSpin.Value = 0, EmptyStr, ' AND JournalNo = ' + QuotedStr(((JournalSpin.Value).ToString)));
      FilterLocal.DBeg := BegDate.Date;
      FilterLocal.DEnd := EndDate.Date;
      FilterLocal.Reestr := IfThen(ReestrFilterSettingEdit.Text = EmptyStr, EmptyStr, ' AND ProjectName = ' +  QuotedStr(ReestrFilterSettingEdit.Text));
      FilterLocal.Brieforg := IfThen(BrieforgFilterSettingEdit.Text = EmptyStr, EmptyStr, ' AND BRIEFORG = ' +  QuotedStr(BrieforgFilterSettingEdit.Text));
      FilterLocal.VidDoc := ifThen(VidDocFilterSettingEdit.Text = EmptyStr, EmptyStr, ' AND VID_DOC = ' +  QuotedStr(VidDocFilterSettingEdit.Text));
      FilterLocal.Driver := IfThen(DriverFilterSettingEdit.Text = EmptyStr, EmptyStr, ' AND L_CP2_PLAT = ' + QuotedStr(DriverFilterSettingEdit.Text));
      FilterLocal.Agent := IfThen(AgentFilterSettingEdit.Text = EmptyStr, EmptyStr, ' AND L_CP1_PLAT = ' +  QuotedStr(AgentFilterSettingEdit.Text));

      case TypeBuildCombo.ItemIndex of
        0,1: FilterLocal.BuildStr := EmptyStr;
        2: FilterLocal.BuildStr := ' AND H.Status = 2 ';
        3: FilterLocal.BuildStr := ' AND H.Status = 3 ';
      end;

    finally
      strReques := SSQLGetOrdersHeaderLocal + ' WHERE OrderDate BETWEEN ' + QuotedStr(FormatDateTime('yyyy-mm-dd', FilterLocal.DBeg)) + ' AND ' + QuotedStr(FormatDateTime('yyyy-mm-dd', FilterLocal.DEnd)) +
                   FilterLocal.JournalNo + FilterLocal.Reestr + FilterLocal.Brieforg + FilterLocal.VidDoc + FilterLocal.Driver + FilterLocal.Agent + FilterLocal.BuildStr;
      strRequesCountDoc :=  SSQLGetCountOrdersHeader + ' WHERE OrderDate BETWEEN ' + QuotedStr(FormatDateTime('yyyy-mm-dd', FilterLocal.DBeg)) + ' AND ' + QuotedStr(FormatDateTime('yyyy-mm-dd', FilterLocal.DEnd)) +
                   FilterLocal.JournalNo + FilterLocal.Reestr + FilterLocal.Brieforg + FilterLocal.VidDoc + FilterLocal.Driver + FilterLocal.Agent + FilterLocal.BuildStr;

      RefreshNaklBtnClick(Self);
    end;
  except
     FillChar(FilterLocal, SizeOf(TFilter), #0);
  end;
end;

procedure TOrdersForm.setGlobalDates(DBegP, DEndP: TDate);
begin
    DatesLocal.DBeg := DBegP;
    DatesLocal.DEnd := DEndP;
end;

procedure TOrdersForm.setNaklDetail;
begin
    NumDocNaklDetailLBl.Text := NaklRec.NumDoc.ToString;
    JournalNaklDetailLBl.Text := NaklRec.JournalNo.ToString;
    BrieforgNaklDetailLBl.Text := NaklRec.BRIEFORG;
    OrganizaklNaklDetailLBl.Text := NaklRec.ORGANIZNKL;
    TypeOperNaklDetailLBl.Text := NaklRec.VID_DOC;
    DriverNaklDetailLBl.Text :=  NaklRec.L_CP2_PLAT;
    AgentNaklDetailLBl.Text := NaklRec.L_CP1_PLAT;
    SummaFactNaklDetailLBl.Text := NaklRec.SUM_ROZN;
    SummaRoznNaklDetailLBl.Text := NaklRec.SUM_POR;

    case NaklRec.Status of
      0, 1: StatusNaklDetailLBl.Text := 'Не собран';
      2:    StatusNaklDetailLBl.Text := 'Не завершен';
      3:    StatusNaklDetailLBl.Text := 'Собран';
    end;
end;

procedure TOrdersForm.setOrdersBottomSBInfo();
begin
  try
     try
      if strRequesCountDoc.IsEmpty then
         strRequesCountDoc := SSQLGetCountOrdersHeader + ' WHERE OrderDate BETWEEN ' +
                                                  QuotedStr(FormatDateTime('yyyy-mm-dd', FilterLocal.DBeg)) + ' AND ' +
                                                  QuotedStr(FormatDateTime('yyyy-mm-dd', FilterLocal.DEnd));

       AppDataLocal.EveryOne.Active := False;
       AppDataLocal.EveryOne.SQL.Text := strRequesCountDoc;
       AppDataLocal.EveryOne.Active := True;
     finally
       KolDocLbl.Text := Format('Документов: %d', [AppDataLocal.EveryOne.FieldByName('CountNacl').AsInteger]);
       KolBuildDocLbl.Text := Format('Собрано: %d', [AppDataLocal.EveryOne.FieldByName('CountBuild').AsInteger]);
     end;
  except
     on Err: Exception do
       ShowMessage('Ошибка получения информации о количестве док-ов!' + #13 + 'Сообщение: ' + Err.Message);
  end;
end;

procedure TOrdersForm.SettingFilterBtnClick(Sender: TObject);
begin
   PanelHide(NaklRigthMenuLayout, NaklRightMenuFA);
   PanelView(FilterSettingLayout, FilterSettingFA);
end;

procedure TOrdersForm.StatistLVClick(Sender: TObject);
var
   KeyboardService: IFMXVirtualKeyboardService;
begin
  PanelHide(RightStatistMenuLayout,  RightStatistMenuFA);
  if TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(KeyboardService)) then
       KeyboardService.HideVirtualKeyboard;
end;

procedure TOrdersForm.StatistLVGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  TabsOrder.OnGesture(Sender, EventInfo, Handled);
end;

procedure TOrdersForm.StatistLVItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  PanelHide(RightStatistMenuLayout,  RightStatistMenuFA);

  StatistNakl.CollectorUID := (AItem.Data['CollectorUID'].AsString).toInteger;
  StatistNakl.CollectorName := AItem.Data['Collector'].AsString;
  StatistNakl.CollectNaklCount := (AItem.Data['DocKol'].AsString).toInteger;
end;

procedure TOrdersForm.SynchBtnClick(Sender: TObject);
var
   exchanger: TExcangerNakl;
begin
    exchanger := TExcangerNakl.Create(DBegSynchEdit.Date, DEndSynchEdit.Date, ReestrSynchEdit.Text);
    {$IFDEF ANDROID}
    if wifiConnect1.getCheckConnectWifi = False then
        Begin
          TDialogService.MessageDialog('Для синхронизации необходимо активное WIFI соединение!' + #13 + 'Открыть настройки WiFi?', System.UITypes.TMsgDlgType.mtInformation ,
                                        [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo],
                                        System.UITypes.TMsgDlgBtn.mbYes, 0,

                                        procedure(const AResult: TModalResult)
                                        Begin
                                          case AResult of
                                            mrYes: Begin
                                                    wifiConnect1.OpenSettingWifi();
                                                    if wifiConnect1.getCheckConnectWifi = True then
                                                      synchronizeToRemote();
                                                   End;
                                            mrNo: Exit();
                                          end;
                                        End);
        End
        else
           synchronizeToRemote();
    {$ENDIF}

    {$IFDEF MSWINDOWS}
           synchronizeToRemote();
           {try
             exchanger.pushNaklHeadLocalToRemote;
             exchanger.pushProcessedDocLocalToRemote();
             exchanger.clearNaklHeadLocal();
             exchanger.clearNaklMoveLocal();
             exchanger.clearProcessedDocLocal();
             exchanger.addNaklHeadRemoteToLocal();
             exchanger.getProcessedDocRemote();
           finally
             FreeAndNil(exchanger);
            end;    }
    {$ENDIF}

end;

procedure TOrdersForm.SynchRectGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  TabsOrder.OnGesture(Sender, EventInfo, Handled);
end;

procedure TOrdersForm.synchronizeToRemote;
var
    exchanger: TExcangerNakl;
    task: ITask;
begin
      try
        task := TTask.Create(procedure()
                             Begin
                                exchanger := TExcangerNakl.Create(DBegSynchEdit.Date, DEndSynchEdit.Date, ReestrSynchEdit.Text);
                                  try
                                    try
                                      IndicateSynchLayout.Visible := True;
                                      IndicateSynchPie.EndAngle := 0;

                                      IndicateSynchLbl.Text := 'Передача собранных документов...';
                                      exchanger.pushNaklHeadLocalToRemote;
                                      IndicateSynchPie.EndAngle := 51.5;
                                      IndicateSynchText.Text := '14';
                                      Sleep(2000);

                                      IndicateSynchLbl.Text := 'Передача документов сборщиков...';
                                      exchanger.pushProcessedDocLocalToRemote;
                                      IndicateSynchPie.EndAngle := 103;
                                      IndicateSynchText.Text := '25';
                                      Sleep(2000);

                                      IndicateSynchLbl.Text := 'Очистка реестра документов...';
                                      exchanger.clearNaklHeadLocal();
                                      IndicateSynchPie.EndAngle := 154.5;
                                      IndicateSynchText.Text := '40';
                                      Sleep(2000);

                                      IndicateSynchLbl.Text := 'Очистка реестра деталей документов...';
                                      exchanger.clearNaklMoveLocal();
                                      IndicateSynchPie.EndAngle := 209;
                                      IndicateSynchText.Text := '55';
                                      Sleep(2000);

                                      IndicateSynchLbl.Text := 'Очистка реестра документов сборщиков...';
                                      exchanger.clearProcessedDocLocal();
                                      IndicateSynchPie.EndAngle := 260.5;
                                      IndicateSynchText.Text := '70';
                                      Sleep(2000);

                                      IndicateSynchLbl.Text := 'Получение документов с сервера...';
                                      exchanger.addNaklHeadRemoteToLocal();
                                      IndicateSynchPie.EndAngle := 315;
                                      IndicateSynchText.Text := '85';
                                      Sleep(2000);

                                      IndicateSynchLbl.Text := 'Получение документов сборщиков...';
                                      exchanger.getProcessedDocRemote();
                                      IndicateSynchPie.EndAngle := 360;
                                      IndicateSynchText.Text := '100';
                                      Sleep(2000);
                                    except
                                      on Ex: Exception do
                                        Begin
                                         exchanger.Destroy;
                                         IndicateSynchLayout.Visible := False;

                                         if (Assigned(task) and (task.Status = TTaskStatus.Exception)) then
                                           task.Cancel;
                                          ShowMessage('Ошибка получения накладных' + #13 + 'Сообщение: ' + Ex.Message);
                                        End;
                                    end;
                                  finally
                                     exchanger.Destroy;
                                     IndicateSynchLayout.Visible := False;
                                  end;
                             End);
        task.Start;
      finally
      end;
end;

procedure TOrdersForm.TabsOrderChange(Sender: TObject);
begin
  PanelAllHide();
end;

procedure TOrdersForm.TabsOrderGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
    case EventInfo.GestureID of
      sgiLeft: Begin
                 TabsOrder.Next();
                 Handled := True;
               End;

      sgiRight: Begin
                  TabsOrder.Previous();
                  Handled := True;
                End;
    end;
end;

procedure TOrdersForm.TypeBuildComboChange(Sender: TObject);
begin
  NaklRec.Status := TypeBuildCombo.ItemIndex;
end;

procedure TOrdersForm.VidDocFilterSettingEditClick(Sender: TObject);
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

{ TListViewSearchHelper }

function TListViewSearchHelper.SearchBox: TSearchBox;
var
   AIdx: integer;
begin
  Result := nil;
  for AIdx := 0 to ComponentCount - 1 do
    Begin
      if Self.Components[AIdx] is TSearchBox then
         Result := TSearchBox(Components[AIdx]);
         Break;
    End;
end;

end.

