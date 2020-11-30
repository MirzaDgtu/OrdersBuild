unit Keeper;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.TabControl,
  System.ImageList, FMX.ImgList, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Gestures, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.DBScope, System.Generics.Collections, KeeperAct, FMX.DialogService;

type
  TKeeperForm = class(TForm)
    KeeperHeaderTB: TToolBar;
    MainLayout: TLayout;
    BackBtn: TSpeedButton;
    OkBtn: TSpeedButton;
    KeeperHeaderLbl: TLabel;
    Tabs: TTabControl;
    TeamTab: TTabItem;
    CollectorsTab: TTabItem;
    IL35: TImageList;
    TeamBottomSB: TStatusBar;
    TeamBottomTB: TToolBar;
    TeamBottomLbl: TLabel;
    TeamLV: TListView;
    CollectorsLayout: TLayout;
    CollectorsBottomTB: TToolBar;
    CollectorsBottomSB: TStatusBar;
    CollectorsBottomLV: TLabel;
    TeamGPL: TGridPanelLayout;
    RefreshKeeperTeamBtn: TSpeedButton;
    DeleteCollectorsBtn: TSpeedButton;
    CollectorsGPL: TGridPanelLayout;
    GoToTeamBtn: TSpeedButton;
    AddCollectorBtn: TSpeedButton;
    CollectorsLV: TListView;
    GM: TGestureManager;
    BL: TBindingsList;
    CollectorBS: TBindSourceDB;
    LinkFillControlToField2: TLinkFillControlToField;
    LinkListControlToField1: TLinkListControlToField;
    RefreshCollectorBtn: TSpeedButton;
    GoToCollectorsBtn: TSpeedButton;
    TeamBS: TBindSourceDB;
    procedure TeamLVGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure CollectorsLVGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure DeleteCollectorsBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabsGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure CollectorsLVItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure RefreshCollectorBtnClick(Sender: TObject);
    procedure AddCollectorBtnClick(Sender: TObject);
    procedure GoToCollectorsBtnClick(Sender: TObject);
    procedure RefreshKeeperTeamBtnClick(Sender: TObject);
    procedure GoToTeamBtnClick(Sender: TObject);
    procedure TeamLVItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
    keeperAction: TKeeperAction;
    FCollectorName: string;
    FKeeperCollectorUID: integer;
    FCollectorUID: integer;
    FKeeperCollectorName: string;
    FItemIndexLV: Integer;
    FTeamCollectors: TList<Integer>;
    procedure setSbInfo(index: smallint);
    procedure SetCollectorName(const Value: string);
    procedure SetCollectorUID(const Value: integer);
    procedure SetKeeperCollectorName(const Value: string);
    procedure SetKeeperCollectorUID(const Value: integer);
    procedure SetItemIndexLV(const Value: Integer);
    procedure setTeamCollectorsList();

  protected
    property CollectorUID: integer read FCollectorUID write SetCollectorUID;
    property CollectorName: string read FCollectorName write SetCollectorName;

    property KeeperCollectorUID: integer read FKeeperCollectorUID write SetKeeperCollectorUID;
    property KeeperCollectorName: string read FKeeperCollectorName write SetKeeperCollectorName;
    property ItemIndexLV: Integer read FItemIndexLV write SetItemIndexLV;
  public
    { Public declarations }

    constructor Create();
  end;

var
  KeeperForm: TKeeperForm;

implementation

{$R *.fmx}

uses SConsts, ModuleDataLocal, ModuleDataRemote,
  Globals, Collectors;

procedure TKeeperForm.AddCollectorBtnClick(Sender: TObject);
begin
  if (CollectorUID <> 0) and
     (not FTeamCollectors.Contains(CollectorUID)) then
    try
      keeperAction.Add(CurrentUser.ID, CurrentUser.Name,
                       CollectorUID, CollectorName);
      FTeamCollectors.Add(CollectorUID);
    finally
      TKeeperAction.Get(CurrentUser.ID);
      setSbInfo(0);
    End;
end;

procedure TKeeperForm.CollectorsLVGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
    Tabs.OnGesture(Sender, EventInfo, Handled);
end;

procedure TKeeperForm.CollectorsLVItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  CollectorUID := (AItem.Data['UID'].AsString).toInteger;
  CollectorName := AItem.Data['Name'].AsString;
  ItemIndexLV := AItem.Index;
end;

constructor TKeeperForm.Create;
begin
  inherited Create(Application);
  keeperAction := TKeeperAction.Create();

  TKeeperAction.Get(CurrentUser.ID);
  TCollectors.Get(True);
  Tabs.ActiveTab := TeamTab;
  setTeamCollectorsList();

  setSbInfo(1);
end;

procedure TKeeperForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {$IFDEF ANDROID}
    Action := TCloseAction.caFree;
  {$ENDIF}
end;

procedure TKeeperForm.DeleteCollectorsBtnClick(Sender: TObject);
begin
  if KeeperCollectorUID <> 0 then
   try
     keeperAction.Delete(CurrentUser.ID, KeeperCollectorUID);
     FTeamCollectors.Remove(KeeperCollectorUID);
   finally
     TKeeperAction.Get(CurrentUser.ID);
     setSbInfo(0);
   end;
end;

procedure TKeeperForm.GoToCollectorsBtnClick(Sender: TObject);
begin
  Tabs.Next();
end;

procedure TKeeperForm.GoToTeamBtnClick(Sender: TObject);
begin
  Tabs.Previous();
end;

procedure TKeeperForm.RefreshCollectorBtnClick(Sender: TObject);
//var
//    collAct: TCollectors;
begin
//  collAct := TCollectors.Create();

//  try
//    collAct.Add;
//  finally
//    TCollectors.Get(True);
//    setSbInfo(1);
//  end;
  TCollectors.Get(True);

end;

procedure TKeeperForm.RefreshKeeperTeamBtnClick(Sender: TObject);
begin
  try
    TKeeperAction.Get(CurrentUser.ID);
  finally
    setSbInfo(0);
  end;
end;

procedure TKeeperForm.SetCollectorName(const Value: string);
begin
  FCollectorName := Value;
end;

procedure TKeeperForm.SetCollectorUID(const Value: integer);
begin
  FCollectorUID := Value;
end;

procedure TKeeperForm.SetItemIndexLV(const Value: Integer);
begin
  FItemIndexLV := Value;
end;

procedure TKeeperForm.SetKeeperCollectorName(const Value: string);
begin
  FKeeperCollectorName := Value;
end;

procedure TKeeperForm.SetKeeperCollectorUID(const Value: integer);
begin
  FKeeperCollectorUID := Value;
end;

procedure TKeeperForm.setSbInfo(index: smallint);
begin
   case index of
    0: Begin
          TeamBottomLbl.Text := Format('—борщиков: %d', [AppDataLocal.KeeperAccess.RecordCount]);
       End;
    1: begin
          CollectorsBottomLV.Text := Format('—борщиков: %d', [AppDataLocal.Collectors.RecordCount]);
       end;
   end;
end;

procedure TKeeperForm.setTeamCollectorsList;
begin
  FTeamCollectors := TList<Integer>.Create;

  if (AppDataLocal.KeeperAccess.Active) AND
     (not AppDataLocal.KeeperAccess.IsEmpty) then
     try
       FTeamCollectors.Clear;

       while not AppDataLocal.KeeperAccess.Eof do
        Begin
          FTeamCollectors.Add(AppDataLocal.KeeperAccessCollectorUID.AsInteger);
          AppDataLocal.KeeperAccess.Next;
        End;
     finally
      setSbInfo(0);
     end;

end;

procedure TKeeperForm.TabsGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
      case EventInfo.GestureID of
      sgiLeft: Begin
                 Tabs.Next();
                 Handled := True;
               End;

      sgiRight: Begin
                  Tabs.Previous();
                  Handled := True;
                End;
    end;
end;

procedure TKeeperForm.TeamLVGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  Tabs.OnGesture(Sender, EventInfo, Handled);
end;

procedure TKeeperForm.TeamLVItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  KeeperCollectorUID := (AItem.Data['CollectorUID'].AsString).Tointeger;
  KeeperCollectorName := AItem.Data['CollectorName'].AsString;
end;

end.
