unit Keeper;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.TabControl,
  System.ImageList, FMX.ImgList, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Gestures;

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
    procedure TeamTabGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure TeamLVGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure CollectorsLVGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure GoToCollectorsBtnClick(Sender: TObject);
    procedure GoToTeamBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KeeperForm: TKeeperForm;

implementation

{$R *.fmx}

procedure TKeeperForm.CollectorsLVGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
    Tabs.OnGesture(Sender, EventInfo, Handled);
end;

procedure TKeeperForm.GoToCollectorsBtnClick(Sender: TObject);
begin
  Tabs.Next();
end;

procedure TKeeperForm.GoToTeamBtnClick(Sender: TObject);
begin
  Tabs.Previous();
end;

procedure TKeeperForm.TeamLVGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  Tabs.OnGesture(Sender, EventInfo, Handled);
end;

procedure TKeeperForm.TeamTabGesture(Sender: TObject;
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

end.
