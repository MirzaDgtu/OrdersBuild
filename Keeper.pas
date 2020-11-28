unit Keeper;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.TabControl,
  System.ImageList, FMX.ImgList, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Gestures, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.DBScope, System.Generics.Collections, KeeperAct;

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
    DeleteCollectorsBtn: TSpeedButton;
    GoToCollectorsBtn: TSpeedButton;
    CollectorsGPL: TGridPanelLayout;
    GoToTeamBtn: TSpeedButton;
    RefreshCollectorBtn: TSpeedButton;
    CollectorsLV: TListView;
    GM: TGestureManager;
    BL: TBindingsList;
    CollectorBS: TBindSourceDB;
    LinkFillControlToField2: TLinkFillControlToField;
    TeamBS: TBindSourceDB;
    LinkListControlToField1: TLinkListControlToField;
    procedure TeamLVGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure CollectorsLVGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure GoToCollectorsBtnClick(Sender: TObject);
    procedure GoToTeamBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabsGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure CollectorsLVUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure CollectorsLVItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure RefreshCollectorBtnClick(Sender: TObject);
  private
    { Private declarations }
    keeperAction: TKeeperAction;
    FCollectorName: string;
    FKeeperCollectorUID: integer;
    FCollectorUID: integer;
    FKeeperCollectorName: string;
    procedure updateCollectorCheckList();
    procedure SetCollectorName(const Value: string);
    procedure SetCollectorUID(const Value: integer);
    procedure SetKeeperCollectorName(const Value: string);
    procedure SetKeeperCollectorUID(const Value: integer);

  protected
    property CollectorUID: integer read FCollectorUID write SetCollectorUID;
    property CollectorName: string read FCollectorName write SetCollectorName;

    property KeeperCollectorUID: integer read FKeeperCollectorUID write SetKeeperCollectorUID;
    property KeeperCollectorName: string read FKeeperCollectorName write SetKeeperCollectorName;
  public
    { Public declarations }
    FCollectorTeam: TList<Integer>;
    FCheckedBtnA: TList<Integer>;

    constructor Create();
  end;

var
  KeeperForm: TKeeperForm;

implementation

{$R *.fmx}

uses SConsts, ZXing.ScanManager, ModuleDataLocal, ModuleDataRemote,
  Globals, Collectors;

procedure TKeeperForm.CollectorsLVGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
    Tabs.OnGesture(Sender, EventInfo, Handled);
end;

procedure TKeeperForm.CollectorsLVItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var
  accessory: TListItemAccessory;
begin
  CollectorUID := (AItem.Data['UID'].AsString).toInteger;
  CollectorName := AItem.Data['Name'].AsString;

  accessory := AItem.Objects.FindObjectT<TListItemAccessory>('CheckBtnA');

  try
    if accessory.Visible then
      begin
        accessory.Visible := False;
        FCheckedBtnA.Remove(AItem.Index);

        keeperAction.Delete(CurrentUser.ID, CollectorUID);
      end
    else
      Begin
        accessory.Visible := True;
        FCheckedBtnA.Add(AItem.Index);
        keeperAction.Add(CurrentUser.ID, CurrentUser.Name,
                         CollectorUID, CollectorName);
      End;
  finally
    TKeeperAction.Get(CurrentUser.ID);
  end;


end;

procedure TKeeperForm.CollectorsLVUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
var
      ac: TListItemAccessory;
begin
 ac := AItem.Objects.FindObjectT<TListItemAccessory>('CheckBtnA');

 if Assigned(FCheckedBtnA) then
  Begin
    if ac <> nil then
        AItem.Objects.FindObjectT<TListItemAccessory>('CheckBtnA').Visible := FCheckedBtnA.Contains(AItem.Index);
  End;
end;

constructor TKeeperForm.Create;
begin
  inherited Create(Application);
  TKeeperAction.Get(CurrentUser.ID);
  TCollectors.Get(True);
  updateCollectorCheckList();

  keeperAction := TKeeperAction.Create();
end;

procedure TKeeperForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {$IFDEF ANDROID}
    Action := TCloseAction.caFree;
  {$ENDIF}
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
begin
  TCollectors.Get(True);
end;

procedure TKeeperForm.SetCollectorName(const Value: string);
begin
  FCollectorName := Value;
end;

procedure TKeeperForm.SetCollectorUID(const Value: integer);
begin
  FCollectorUID := Value;
end;

procedure TKeeperForm.SetKeeperCollectorName(const Value: string);
begin
  FKeeperCollectorName := Value;
end;

procedure TKeeperForm.SetKeeperCollectorUID(const Value: integer);
begin
  FKeeperCollectorUID := Value;
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

procedure TKeeperForm.updateCollectorCheckList;
var
    i: integer;
    AItem: TListViewItem;

  procedure addCollectorUidOfTeamToList;
  Begin
    if (AppDataLocal.KeeperAccess.Active) and
      (not AppDataLocal.KeeperAccess.IsEmpty) then
      Begin
        FCollectorTeam := TList<Integer>.Create;
        FCollectorTeam.Clear;
        AppDataLocal.KeeperAccess.First;
        while not AppDataLocal.KeeperAccess.Eof do
        begin
          FCollectorTeam.Add(AppDataLocal.KeeperAccess.FieldByName('CollectorUID').AsInteger);
          AppDataLocal.KeeperAccess.Next();
        end;
      end;
  end;
begin
  FCheckedBtnA := TList<Integer>.Create;
  FCheckedBtnA.Clear;
  addCollectorUidOfTeamToList();

  if Assigned(FCollectorTeam) then
  Begin
    for I := 0 to CollectorsLV.Items.Count - 1  do
      Begin
        AItem := (CollectorsLV.Items.Item[i] as TListViewItem);

        if FCollectorTeam.Contains((AItem.Data['UID'].AsString).ToInteger) then
           FCheckedBtnA.Add(AItem.Index)
      end;
  end;
end;

end.
