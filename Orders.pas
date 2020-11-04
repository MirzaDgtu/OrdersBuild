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
  System.Threading, System.SyncObjs;

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
    BindSourceDB1: TBindSourceDB;
    LinkListControlToField8: TLinkListControlToField;
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
  private
    { Private declarations }
    strReques: string;
    statusDocLoc: Byte;
    procedure PanelView(LayoutName: TLayout; FA: TFloatAnimation);
    procedure PanelHide(LayoutName: TLayout; FA: TFloatAnimation);
    procedure PanelAllHide();

    procedure setFilterSettingRecord();
    procedure setGlobalDates(DBegP, DEndP: TDate);
    procedure setOrdersBottomSBInfo();
    procedure setActualDate();

    procedure correctDP();


  public
    { Public declarations }
  end;

var
  OrdersForm: TOrdersForm;

implementation

{$R *.fmx}
{$R *.XLgXhdpiTb.fmx ANDROID}

uses ModuleDataLocal, SConsts, Globals, Reestrs, Interfaces, Nakl, NaklAct,
  Statist;
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

procedure TOrdersForm.BrieforgFilterSettingBtnClick(Sender: TObject);
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
    iVal: integer;
begin
   PanelHide(NaklRigthMenuLayout, NaklRightMenuFA);

   if NaklRec.UnicumNum > 0 then
     try
       NaklF := TNaklForm.Create(NaklRec.UnicumNum, NaklRec.NumDoc, NaklRec.KolProd,
                                 NaklRec.KolBuildProd, NaklRec.Status, NaklRec.CollectorUID, NaklRec.Collector);
       NaklAct := TNaklAction.Create(NaklRec.UnicumNum);



       {$IFDEF ANDROID}
          NaklF.ShowModal(procedure (ModalResult: TModalResult
                                     Begin
                                      if ModalResult = mrOk then
                                       Begin
                                        NaklAct.Delete(NaklRec.UnicumNum);
                                        if NaklF.FProdChecked.Count > 0 then
                                          Begin
                                            for iVal in NaklF.FProdChecked do
                                               NaklAct.SaveBuildProd(NaklF.UnicumNumP, iVal, 1);
                                          End
                                        else
                                            TNaklAction.setMoveNaklDefault(NaklF.UnicumNumP);

                                          TNaklAction.SaveHeadNakl(NaklF.UnicumNumP, NaklF.KolProdP, NaklF.FProdChecked.Count);
                                        end;
                                     end);
       {$ENDIF}

       {$IFDEF MSWINDOWS}
          if NaklF.ShowModal = mrOk then
            try
               if NaklF.FProdChecked.Count > 0 then
                  Begin
                   TNaklAction.setMoveNaklDefault(NaklRec.UnicumNum);
                    for iVal in NaklF.FProdChecked do
                       NaklAct.SaveBuildProd(NaklF.UnicumNumP, iVal, 1);
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

procedure TOrdersForm.EndDateChange(Sender: TObject);
begin
  correctDP();
  DEndSynchEdit.Date := EndDate.Date;
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

procedure TOrdersForm.LoaderNaklBtnClick(Sender: TObject);
begin
  TStatist.Get(StatistNakl.CollectorUID);
  NameStatistNaklHeadLbl.Text := StatistNakl.CollectorName;
  DocKolSBInfoLbl.Text := Format('Документов: %d', [StatistNakl.CollectNaklCount]);
  PanelView(StatistNaklLayout, StatistNaklFA);
end;

procedure TOrdersForm.NaklLVClick(Sender: TObject);
begin
   PanelHide(NaklRigthMenuLayout, NaklRightMenuFA);
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
   finally
     PanelHide(NaklRigthMenuLayout, NaklRightMenuFA);
   end;

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
begin
  try
    AppDataLocal.CollectorBuild.Active := False;
    AppDataLocal.CollectorBuild.SQL.Text := Format(SSQLGetCollectCountOrders, [FormatDateTime('yyyy-mm-dd', BegDate.Date),
                                                                               FormatDateTime('yyyy-mm-dd', EndDate.Date)]);
    AppDataLocal.CollectorBuild.Active := True;
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
  except
  end;
end;

procedure TOrdersForm.setFilterSettingRecord;
begin
  strReques := EmptyStr;

  try
    try
      FilterLocal.JournalNo := IfThen(JournalSpin.Value = 0, EmptyStr, ' AND JournalNo = ' + QuotedStr(((JournalSpin.Value). ToString)));
      FilterLocal.DBeg := BegDate.Date;
      FilterLocal.DEnd := EndDate.Date;
      FilterLocal.Reestr := IfThen(ReestrFilterSettingEdit.Text = EmptyStr, EmptyStr, ' AND ProjectName = ' +  QuotedStr(ReestrFilterSettingEdit.Text));
      FilterLocal.Brieforg := IfThen(BrieforgFilterSettingEdit.Text = EmptyStr, EmptyStr, ' AND BRIEFORG = ' +  QuotedStr(BrieforgFilterSettingEdit.Text));
      FilterLocal.VidDoc := ifThen(VidDocFilterSettingEdit.Text = EmptyStr, EmptyStr, ' AND VID_DOC = ' +  QuotedStr(VidDocFilterSettingEdit.Text));
      FilterLocal.Driver := IfThen(DriverFilterSettingEdit.Text = EmptyStr, EmptyStr, ' AND L_CP2_PLAT = ' + QuotedStr(DriverFilterSettingEdit.Text));
      FilterLocal.Agent := IfThen(AgentFilterSettingEdit.Text = EmptyStr, EmptyStr, ' AND L_CP1_PLAT = ' +  QuotedStr(AgentFilterSettingEdit.Text));

      case TypeBuildCombo.ItemIndex of
        0: FilterLocal.BuildStr := EmptyStr;
        1: FilterLocal.BuildStr := ' AND Status = 0';
        2: FilterLocal.BuildStr := ' AND Status = 1';
        3: FilterLocal.BuildStr := ' AND Status = 2';
      end;

    finally
      strReques := SSQLGetOrdersHeaderLocal + ' WHERE OrderDate BETWEEN ' + QuotedStr(FormatDateTime('yyyy-mm-dd', FilterLocal.DBeg)) + ' AND ' + QuotedStr(FormatDateTime('yyyy-mm-dd', FilterLocal.DEnd)) +
                   FilterLocal.JournalNo + FilterLocal.Reestr + FilterLocal.Brieforg + FilterLocal.VidDoc + FilterLocal.Driver + FilterLocal.Agent;

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

procedure TOrdersForm.setOrdersBottomSBInfo();
begin
  try
     try
       AppDataLocal.EveryOne.Active := False;
       AppDataLocal.EveryOne.SQL.Text := SSQLGetCountOrdersHeader;
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
begin
  PanelHide(RightStatistMenuLayout,  RightStatistMenuFA);
end;

procedure TOrdersForm.StatistLVItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  PanelHide(RightStatistMenuLayout,  RightStatistMenuFA);

  StatistNakl.CollectorUID := (AItem.Data['CollectorUID'].AsString).toInteger;
  StatistNakl.CollectorName := AItem.Data['Collector'].AsString;
  StatistNakl.CollectNaklCount := (AItem.Data['DocKol'].AsString).toInteger;
end;

procedure TOrdersForm.TabsOrderChange(Sender: TObject);
begin
  PanelAllHide();
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
