unit Nakl;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Edit, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.Objects, FMX.Ani, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  NaklAct, System.Generics.Collections, Globals, FMX.SearchBox, FMX.TabControl, FMX.Platform, FMX.VirtualKeyboard,
  FMX.ListBox, System.Permissions, ZXing.BarcodeFormat, ZXing.ReadResult, ZXing.ScanManager,
  FMX.Media, FMX.DialogService;

type
  TListViewMyHelper = class helper for TListView
  public
    function SearchBox: TSearchBox;
  end;


  TNaklForm = class(TForm)
    MainLayout: TLayout;
    NaklHeaderTB: TToolBar;
    BackNaklBtn: TButton;
    SaveNaklBtn: TButton;
    NumDocNaklLbl: TLabel;
    CollectorTB: TToolBar;
    CollectorLeftLbl: TLabel;
    CollectorBtn: TButton;
    CollectorEdit: TEdit;
    NaklBottomSB: TStatusBar;
    ProductLV: TListView;
    ProductNaklInfo: TGridPanelLayout;
    CountProdNaklLbl: TLabel;
    CountBuildProdNaklLbl: TLabel;
    CollectLayout: TLayout;
    CollectRect: TRectangle;
    CollectHeaderTB: TToolBar;
    BackCollectBtn: TButton;
    RefreshBtn: TButton;
    CollectorHeaderLbl: TLabel;
    CollectorLV: TListView;
    CollectorFA: TFloatAnimation;
    CollectorsBS: TBindSourceDB;
    NaklBL: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    ProductsBS: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    CollectorSB: TStatusBar;
    CollectorCountLbl: TLabel;
    Tabs: TTabControl;
    ProductsTab: TTabItem;
    CameraScanLayout: TLayout;
    CameraScanRect: TRectangle;
    CameraScanHeaderTB: TToolBar;
    BackCameraScanBtn: TSpeedButton;
    SaveCameraScanBtn: TSpeedButton;
    CameraScanHeaderLbl: TLabel;
    CameraScanBottomTB: TToolBar;
    CameraScanBottonBtnsGPL: TGridPanelLayout;
    StopCameraScanBtn: TSpeedButton;
    StartCameraScanBtn: TSpeedButton;
    CameraScanImage: TImage;
    CameraScanLB: TListBox;
    CameraScanSearchLBGH: TListBoxGroupHeader;
    CameraScanLBI: TListBoxItem;
    CameraScanStrikeCodLbl: TLabel;
    CameraScanFA: TFloatAnimation;
    CameraScanBtn: TSpeedButton;
    ClearEditButton1: TClearEditButton;
    StrikeCamera: TCameraComponent;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BackCollectBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure CollectorLVItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ProductLVItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure SaveNaklBtnClick(Sender: TObject);
    procedure ProductLVUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure CollectorEditClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure ProductLVClick(Sender: TObject);
    procedure StrikeCameraSampleBufferReady(Sender: TObject;
      const ATime: TMediaTime);
    procedure StopCameraScanBtnClick(Sender: TObject);
    procedure BackCameraScanBtnClick(Sender: TObject);
    procedure SaveCameraScanBtnClick(Sender: TObject);
    procedure StartCameraScanBtnClick(Sender: TObject);
    procedure CameraScanBtnClick(Sender: TObject);
  private
    { Private declarations }
    FUnicumNumP: integer;
    FNumDocP: integer;
    FKolBuildProdP: integer;
    FKolProdP: integer;
    FStatusP: integer;
    NaklAct: TNaklAction;
    strSearchValue: string;

    // Считывание штрихкода по камере
    fPermissionCamera: String;
    fScanInProgress: Boolean;
    fScanBitmap: TBitmap;
    function AppEvent(AAppEvent: TApplicationEvent; AContext: TObject): Boolean;
    procedure ParseImage();
    procedure CameraPermissionRequestResult(Sender: TObject;
      const APermissions: TArray<string>;
      const AGrantResults: TArray<TPermissionStatus>);
    procedure ExplainReason(Sender: TObject; const APermissions: TArray<string>;
      const APostRationaleProc: TProc);


    procedure setNaklBottomSBInfo(KolProd, KolBuildProd: integer);
    procedure SetNumDocP(const Value: integer);
    procedure SetUnicumNumP(const Value: integer);
    procedure SetKolBuildProdP(const Value: integer);
    procedure SetKolProdP(const Value: integer);
    procedure SetStatusP(const Value: integer);


    procedure PanelCollectorsView();
    procedure PanelCollectorsHide();

    procedure PanelView(LayoutName: TLayout; FA: TFloatAnimation);
    procedure PanelHide(LayoutName: TLayout; FA: TFloatAnimation);

    procedure setCollectSB();

    procedure updateProdCheckedList();
    procedure updateFCheckedBtn();

  public
    { Public declarations }
    FProdChecked: TList<Integer>;
    FCheckedBtnA: TList<Integer>;


    constructor Create(UnicumNum, NumDoc, KolProd, KolBuildProd, Status, CollectorUID: integer; Collector: string) overload;

  published
    property UnicumNumP: integer read FUnicumNumP write SetUnicumNumP;
    property NumDocP: integer read FNumDocP write SetNumDocP;
    property KolBuildProdP: integer read FKolBuildProdP write SetKolBuildProdP;
    property KolProdP: integer read FKolProdP write SetKolProdP;
    property StatusP: integer read FStatusP write SetStatusP default 0;
  end;

var
  NaklForm: TNaklForm;

implementation

{$R *.fmx}

uses ModuleDataLocal, Collectors, Sign, {$IFDEF ANDROID}
    Androidapi.Helpers,
    Androidapi.JNI.JavaTypes,
    Androidapi.JNI.Os
  {$ENDIF};

function TNaklForm.AppEvent(AAppEvent: TApplicationEvent;
  AContext: TObject): Boolean;
begin
  case AAppEvent of
    TApplicationEvent.WillBecomeInactive, TApplicationEvent.EnteredBackground,
      TApplicationEvent.WillTerminate:
      StrikeCamera.Active := false;
  end;
end;

procedure TNaklForm.BackCameraScanBtnClick(Sender: TObject);
begin
  StrikeCamera.Active := False;
  PanelHide(CameraScanLayout, CameraScanFA);
end;

procedure TNaklForm.BackCollectBtnClick(Sender: TObject);
begin
  PanelHide(CollectLayout, CollectorFA);
end;

procedure TNaklForm.CameraPermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
  if (Length(AGrantResults) = 1) and
    (AGrantResults[0] = TPermissionStatus.Granted) then
  begin
    StrikeCamera.Active := false;
    StrikeCamera.Quality := FMX.Media.TVideoCaptureQuality.MediumQuality;
    StrikeCamera.Kind := FMX.Media.TCameraKind.BackCamera;
    StrikeCamera.FocusMode := FMX.Media.TFocusMode.ContinuousAutoFocus;
    StrikeCamera.Active := True;
  end
  else
    TDialogService.ShowMessage
      ('Сканирование невозможно, т.к. не предоставлен доступ к камере устройства!')
end;

procedure TNaklForm.CameraScanBtnClick(Sender: TObject);
begin
   PanelView(CameraScanLayout, CameraScanFA);
end;

procedure TNaklForm.CollectorEditClick(Sender: TObject);
var
    Collectors: TCollectors;
begin
  try
    Collectors := TCollectors.Create();
    setCollectSB();
    PanelView(CollectLayout, CollectorFA);
    //PanelCollectorsView();
  finally
    Collectors.Free;
  end;
end;

procedure TNaklForm.CollectorLVItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  CollectorEdit.Text := AItem.Data['Name'].AsString;
  CollectorNakl.UID := (AItem.Data['UID'].AsString).ToInteger;
  CollectorNakl.Name := AItem.Data['Name'].AsString;

  PanelHide(CollectLayout, CollectorFA);
  //PanelCollectorsHide();
end;

constructor TNaklForm.Create(UnicumNum, NumDoc, KolProd, KolBuildProd, Status, CollectorUID: integer; Collector: string);
var
  AppEventSvc: IFMXApplicationEventService;
begin
    inherited Create(Application);

    FProdChecked := TList<Integer>.Create;
    FCheckedBtnA := TList<Integer>.Create;

    NaklAct := TNaklAction.Create(UnicumNum);
    updateFCheckedBtn();

    NumDocNaklLbl.Text := (NumDoc).ToString;
    UnicumNumP := UnicumNum;
    NumDocP := NumDoc;
    KolBuildProdP := KolBuildProd;
    KolProdP := KolProd;
    StatusP := Status;
    CollectorNakl.UID := CollectorUID;
    CollectorNakl.Name := Collector;
    CollectorEdit.Text := Collector;

    setNaklBottomSBInfo(KolProd, FProdChecked.Count);

  if TPlatformServices.Current.SupportsPlatformService
    (IFMXApplicationEventService, IInterface(AppEventSvc)) then
  begin
    AppEventSvc.SetApplicationEventHandler(AppEvent);
  end;

  fScanBitmap := nil;

{$IFDEF ANDROID}
  fPermissionCamera := JStringToString(TJManifest_permission.JavaClass.CAMERA);
{$ENDIF}
end;

procedure TNaklForm.ExplainReason(Sender: TObject;
  const APermissions: TArray<string>; const APostRationaleProc: TProc);
begin
   TDialogService.ShowMessage
    ('Приложению необходим доступ к камере устройства...',
    procedure(const AResult: TModalResult)
    begin
      APostRationaleProc;
    end)
end;

procedure TNaklForm.FormClose(Sender: TObject; var Action: TCloseAction);
Begin
  {$IFDEF ANDROID}
      Action := TCloseAction.caFree;

      if Assigned(fScanBitmap) then
        FreeAndNil(fScanBitmap);
  {$ENDIF}
end;

procedure TNaklForm.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  Focused := ProductsTab;
  strSearchValue := strSearchValue + KeyChar;

  if Key = 13 then
    Begin
      ProductLV.SearchBox.Text := EmptyStr;
      if Length(strSearchValue) > 0 then
        Begin
          ProductLV.SearchBox.Text := strSearchValue;
          strSearchValue := EmptyStr;
        End;
    End;
end;

procedure TNaklForm.PanelCollectorsHide;
begin
  CollectLayout.Visible := False;
  CollectorFA.Inverse := True;
  CollectorFA.Start();
end;

procedure TNaklForm.PanelCollectorsView;
begin
   CollectLayout.Position.Y := Self.Height + 20;
   CollectLayout.Visible := True;

   CollectorFA.Inverse := False;
   CollectorFA.StartValue := Self.Height + 20;
   CollectorFA.Start;
end;

procedure TNaklForm.PanelHide(LayoutName: TLayout; FA: TFloatAnimation);
begin
   LayoutName.Visible := False;
   FA.Inverse := False;
   FA.Start;
end;

procedure TNaklForm.PanelView(LayoutName: TLayout; FA: TFloatAnimation);
begin
  LayoutName.Height := Self.Height + 30;
  LayoutName.Visible := True;

  FA.Inverse := False;
  FA.StartValue := Self.Height + 30;
  FA.Start;
end;

procedure TNaklForm.ParseImage;
begin
  TThread.CreateAnonymousThread(
    procedure
    var
      ReadResult: TReadResult;
      ScanManager: TScanManager;

    begin
      try
        fScanInProgress := True;
        ScanManager := TScanManager.Create(TBarcodeFormat.Auto, nil);

        try

          ReadResult := ScanManager.Scan(fScanBitmap);

        except
          on E: Exception do
          begin

            TThread.Synchronize(TThread.CurrentThread,
              procedure
              begin
                TDialogService.ShowMessage(E.Message);
              end);

            exit;
          end;

        end;

        TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin

            if (Length(CameraScanSearchLBGH.Text) > 10) then
            begin
              CameraScanSearchLBGH.Text := '*';
            end;

            CameraScanSearchLBGH.Text := CameraScanSearchLBGH.Text + '*';
            if (ReadResult <> nil) then
            begin
               CameraScanStrikeCodLbl.Text := ReadResult.Text;
            end;

          end);

      finally
        if ReadResult <> nil then
          FreeAndNil(ReadResult);

        ScanManager.Free;
        fScanInProgress := false;
      end;

    end).Start();
end;

procedure TNaklForm.ProductLVClick(Sender: TObject);
var
   KeyboardService: IFMXVirtualKeyboardService;
begin
   if TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(KeyboardService)) then
        KeyboardService.HideVirtualKeyboard;
end;

procedure TNaklForm.ProductLVItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var
  accessory: TListItemAccessory;
  sa: IListViewPresentationParent;
begin
  accessory := AItem.Objects.FindObjectT<TListItemAccessory>('CheckBtnA');

  if accessory.Visible then
    begin
      accessory.Visible := False;
      FCheckedBtnA.Remove(AItem.Index);
      if FProdChecked.Contains((AItem.Data['Article'].AsString).ToInteger) then
          FProdChecked.Remove((AItem.Data['Article'].AsString).ToInteger);
    end
  else
    Begin
      accessory.Visible := True;
      FProdChecked.Add((AItem.Data['Article'].AsString).ToInteger);
      FCheckedBtnA.Add(AItem.Index);
    End;

    setNaklBottomSBInfo(KolProdP, FProdChecked.Count);
end;

procedure TNaklForm.ProductLVUpdateObjects(const Sender: TObject;
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

procedure TNaklForm.RefreshBtnClick(Sender: TObject);
var
    Collectors: TCollectors;
begin
  Collectors := TCollectors.Create();
  try
    Collectors.Add();
  finally
    Collectors.Get();
    Collectors.Free;
    setCollectSB();
  end;
end;

procedure TNaklForm.SaveCameraScanBtnClick(Sender: TObject);
begin
    StrikeCamera.Active := False;
    PanelHide(CameraScanLayout, CameraScanFA);
    if Length(CameraScanStrikeCodLbl.Text) > 0 then
       ProductLV.SearchBox.Text := CameraScanStrikeCodLbl.Text;
end;

procedure TNaklForm.SaveNaklBtnClick(Sender: TObject);
begin
  if Length(CollectorEdit.Text) > 0 then
    SaveNaklBtn.ModalResult := mrOk
  else
    ShowMessage('Данные не введены полностью!' + #13 + 'Возможно вы не выбрали сборщика!');
end;

procedure TNaklForm.setCollectSB;
begin
  if AppDataLocal.Collectors.Active then
     CollectorCountLbl.Text := Format('Количество сборщиков: %d', [AppDataLocal.Collectors.RecordCount]);
end;

procedure TNaklForm.SetKolBuildProdP(const Value: integer);
begin
  FKolBuildProdP := Value;
end;

procedure TNaklForm.SetKolProdP(const Value: integer);
begin
  FKolProdP := Value;
end;

procedure TNaklForm.setNaklBottomSBInfo(KolProd, KolBuildProd: integer);
begin
   CountProdNaklLbl.Text := Format('Товаров: %d', [KolProd]);
   CountBuildProdNaklLbl.Text := Format('Собрано: %d', [KolBuildProd]);
end;

procedure TNaklForm.SetNumDocP(const Value: integer);
begin
  FNumDocP := Value;
end;

procedure TNaklForm.SetStatusP(const Value: integer);
begin
  FStatusP := Value;
end;

procedure TNaklForm.SetUnicumNumP(const Value: integer);
begin
  FUnicumNumP := Value;
end;

procedure TNaklForm.StartCameraScanBtnClick(Sender: TObject);
begin
  PermissionsService.RequestPermissions([fPermissionCamera],
    CameraPermissionRequestResult, ExplainReason);
end;

procedure TNaklForm.StopCameraScanBtnClick(Sender: TObject);
begin
  StrikeCamera.Active := false;
end;

procedure TNaklForm.StrikeCameraSampleBufferReady(Sender: TObject;
  const ATime: TMediaTime);
begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    StrikeCamera.SampleBufferToBitmap(CameraScanImage.Bitmap, True);

    if (fScanInProgress) then
    begin
      exit;
    end;


    if Assigned(fScanBitmap) then
      FreeAndNil(fScanBitmap);

    fScanBitmap := TBitmap.Create();
    fScanBitmap.Assign(CameraScanImage.Bitmap);

    ParseImage();
  end);
end;

procedure TNaklForm.updateFCheckedBtn;
var
    i: integer;
    AItem: TListViewItem;
begin
  FCheckedBtnA.Clear;
  FProdChecked.Clear;

  for i := 0 to ProductLV.Items.Count - 1 do
   Begin
     AItem := (ProductLV.Items.Item[i] as TListViewItem);
     if AItem.Data['Status'].AsString = '1' then
      Begin
       FCheckedBtnA.Add(AItem.Index);
       FProdChecked.Add((AItem.Data['Article'].AsString).ToInteger);
      End;
   End;
end;

procedure TNaklForm.updateProdCheckedList;
var
   ac: TListItemAccessory;
begin

  if Assigned(FProdChecked) then
    try
      if not AppDataLocal.OrdersMove.IsEmpty then
        Begin
          FProdChecked.Clear();
          AppDataLocal.OrdersMove.First;

          while not AppDataLocal.OrdersMove.Eof do
            Begin
              if AppDataLocal.OrdersMove.FieldByName('Status').AsInteger = 1 then
                  FProdChecked.Add(AppDataLocal.OrdersMove.FieldByName('Article').AsInteger);
              AppDataLocal.OrdersMove.Next();
            End;
        End
        else
          FProdChecked.Clear();
    finally
    end;
end;

{ TListViewMyHelper }

function TListViewMyHelper.SearchBox: TSearchBox;
var
  AIdx: Integer;
begin
   for AIdx := 0 to Self.ComponentCount-1 do
     if Self.Components[AIdx] is TSearchBox then
      Begin
        Result := TSearchBox(Self.Components[AIdx]);
        Break;
      End;
end;

end.
