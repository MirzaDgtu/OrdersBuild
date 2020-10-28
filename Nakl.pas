unit Nakl;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Edit, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.Objects, FMX.Ani, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  NaklAct;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CollectorBtnClick(Sender: TObject);
    procedure BackCollectBtnClick(Sender: TObject);
  private
    FUnicumNumP: integer;
    FNumDocP: integer;
    FKolBuildProdP: integer;
    FKolProdP: integer;
    FStatusP: integer;
    NaklAct: TNaklAction;
    { Private declarations }
    procedure setNaklBottomSBInfo(KolProd, KolBuildProd: integer);
    procedure SetNumDocP(const Value: integer);
    procedure SetUnicumNumP(const Value: integer);
    procedure SetKolBuildProdP(const Value: integer);
    procedure SetKolProdP(const Value: integer);
    procedure SetStatusP(const Value: integer);

    procedure PanelCollectorsView();
    procedure PanelCollectorsHide();
  public
    { Public declarations }
    constructor Create(UnicumNum, NumDoc, KolProd, KolBuildProd, Status: integer) overload;

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

uses ModuleDataLocal, Collectors;

procedure TNaklForm.BackCollectBtnClick(Sender: TObject);
begin
  PanelCollectorsHide();
end;

procedure TNaklForm.CollectorBtnClick(Sender: TObject);
var
    Collectors: TCollectors;
begin
    Collectors := TCollectors.Create();
    PanelCollectorsView();
end;

constructor TNaklForm.Create(UnicumNum, NumDoc, KolProd, KolBuildProd, Status: integer);
begin
    inherited Create(Application);
    NaklAct := TNaklAction.Create(UnicumNum);

    NumDocNaklLbl.Text := (NumDoc).ToString;
    UnicumNumP := UnicumNum;
    NumDocP := NumDoc;
    KolBuildProdP := KolBuildProd;
    KolProdP := KolProd;
    StatusP := Status;

    setNaklBottomSBInfo(KolProd, KolBuildProd);
end;

procedure TNaklForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
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
     CountProdNaklLbl.Text := KolProd.ToString;
     CountBuildProdNaklLbl.Text := KolBuildProd.ToString;
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

end.
