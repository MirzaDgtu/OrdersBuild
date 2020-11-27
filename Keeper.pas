unit Keeper;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.TabControl,
  System.ImageList, FMX.ImgList, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Gestures, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.DBScope, System.Generics.Collections;

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
    AddCollectorToTeamBtn: TSpeedButton;
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
  private
    { Private declarations }
    procedure updateCollectorCheckList();
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

uses SConsts, ZXing.ScanManager, ModuleDataLocal, ModuleDataRemote, KeeperAct,
  Globals, Collectors;

procedure TKeeperForm.CollectorsLVGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
    Tabs.OnGesture(Sender, EventInfo, Handled);
end;

constructor TKeeperForm.Create;
begin
  inherited Create(Application);
  TKeeperAction.Get(CurrentUser.ID);
  TCollectors.Get(True);
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
  addCollectorUidOfTeamToList();

  for I := 0 to CollectorsLV.Items.Count - 1  do
    Begin
      AItem := (CollectorsLV.Items.Item[i] as TListViewItem);

      if FCollectorTeam.Contains then

    end;
end;

end.
