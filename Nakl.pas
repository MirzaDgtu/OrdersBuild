unit Nakl;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Edit, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.Objects, FMX.Ani;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NaklForm: TNaklForm;

implementation

{$R *.fmx}

procedure TNaklForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

end.
