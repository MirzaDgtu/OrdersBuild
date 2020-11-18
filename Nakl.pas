unit Nakl;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Edit, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.Objects, FMX.Ani, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  NaklAct, System.Generics.Collections, Globals;

type
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
    ClearEditButton1: TClearEditButton;
    CollectorSB: TStatusBar;
    CollectorCountLbl: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CollectorBtnClick(Sender: TObject);
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
    procedure FormActivate(Sender: TObject);
  private
    FUnicumNumP: integer;
    FNumDocP: integer;
    FKolBuildProdP: integer;
    FKolProdP: integer;
    FStatusP: integer;
    NaklAct: TNaklAction;
    flUpdateAction: Byte;
   //FProdChecked: TList<Integer>;
   //FCheckedBtnA: TList<Integer>;
    { Private declarations }
    procedure setNaklBottomSBInfo(KolProd, KolBuildProd: integer);
    procedure SetNumDocP(const Value: integer);
    procedure SetUnicumNumP(const Value: integer);
    procedure SetKolBuildProdP(const Value: integer);
    procedure SetKolProdP(const Value: integer);
    procedure SetStatusP(const Value: integer);

    procedure PanelCollectorsView();
    procedure PanelCollectorsHide();
    procedure setCollectSB();

    procedure updateProdCheckedList();
  public
    { Public declarations }
    FProdChecked: TList<Integer>;
    FCheckedBtnA: TList<Integer>;


    constructor Create(UnicumNum, NumDoc, KolProd, KolBuildProd, Status, CollectorUID: integer; Collector: string) overload;
    destructor Destroy; override;

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

uses ModuleDataLocal, Collectors, Sign;

procedure TNaklForm.BackCollectBtnClick(Sender: TObject);
begin
  PanelCollectorsHide();
end;

procedure TNaklForm.CollectorBtnClick(Sender: TObject);
//var
//    Collectors: TCollectors;
begin
 { try
    Collectors := TCollectors.Create();
    PanelCollectorsView();
  finally
    Collectors.Free;
  end;    }
end;

procedure TNaklForm.CollectorEditClick(Sender: TObject);
var
    Collectors: TCollectors;
begin
  try
    Collectors := TCollectors.Create();
    setCollectSB();
    PanelCollectorsView();
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

  PanelCollectorsHide();
end;

constructor TNaklForm.Create(UnicumNum, NumDoc, KolProd, KolBuildProd, Status, CollectorUID: integer; Collector: string);
begin
    inherited Create(Application);
    FProdChecked := TList<Integer>.Create;
    FCheckedBtnA := TList<Integer>.Create;
    updateProdCheckedList();
    NaklAct := TNaklAction.Create(UnicumNum);

    NumDocNaklLbl.Text := (NumDoc).ToString;
    UnicumNumP := UnicumNum;
    NumDocP := NumDoc;
    KolBuildProdP := KolBuildProd;
    KolProdP := KolProd;
    StatusP := Status;
    CollectorNakl.UID := CollectorUID;
    CollectorNakl.Name := Collector;
    CollectorEdit.Text := Collector;
    flUpdateAction := 0;

    setNaklBottomSBInfo(KolProd, KolBuildProd);
end;

destructor TNaklForm.Destroy;
begin
  FProdChecked.Free();
  inherited;
end;

procedure TNaklForm.FormActivate(Sender: TObject);
begin
  flUpdateAction := 1;
end;

procedure TNaklForm.FormClose(Sender: TObject; var Action: TCloseAction);
Begin
  {$IFDEF ANDROID}
    Action := TCloseAction.caFree;
  {$ENDIF}
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

procedure TNaklForm.ProductLVItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var
  accessory: TListItemAccessory;
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
begin
   AItem.Objects.FindObjectT<TListItemAccessory>('CheckBtnA').Visible := True;//FCheckedBtnA.Contains(AItem.Index);
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

procedure TNaklForm.SaveNaklBtnClick(Sender: TObject);
begin
  if Length(CollectorEdit.Text) > 0 then
    SaveNaklBtn.ModalResult := mrOk
  else
    ShowMessage('������ �� ������� ���������!' + #13 + '�������� �� �� ������� ��������!');
end;

procedure TNaklForm.setCollectSB;
begin
  if AppDataLocal.Collectors.Active then
     CollectorCountLbl.Text := Format('���������� ���������: %d', [AppDataLocal.Collectors.RecordCount]);
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
   CountProdNaklLbl.Text := Format('�������: %d', [KolProd]);
   CountBuildProdNaklLbl.Text := Format('�������: %d', [KolBuildProd]);
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

procedure TNaklForm.updateProdCheckedList;
var
   i: integer;
begin
  i := 0;
  if Assigned(FProdChecked) then
    try
      if not AppDataLocal.OrdersMove.IsEmpty then
        Begin
          FProdChecked.Clear();
          AppDataLocal.OrdersMove.First;

          while not AppDataLocal.OrdersMove.Eof do
            Begin
              i := i + 1;
              if AppDataLocal.OrdersMove.FieldByName('Status').AsInteger = 1 then
                Begin
                  FProdChecked.Add(AppDataLocal.OrdersMove.FieldByName('Article').AsInteger);
                  FCheckedBtnA.Add(i);
                End;
              AppDataLocal.OrdersMove.Next();
            End;
        End;
    finally
    end;
end;

end.
