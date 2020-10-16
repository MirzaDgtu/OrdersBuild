unit Sign;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, System.ImageList, FMX.ImgList, FMX.Controls.Presentation,
  FMX.Edit, FMX.ListBox, FMX.Objects, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.Ani, Users,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TSignForm = class(TForm)
    MainLayout: TLayout;
    SignHeaderTB: TToolBar;
    SignBottomTB: TToolBar;
    Images: TImageList;
    SettingParamSBtn: TSpeedButton;
    SignHeadeLbl: TLabel;
    SignSBtn: TSpeedButton;
    DefaultSBtn: TSpeedButton;
    AOuthRect: TRectangle;
    AOuthLB: TListBox;
    SignLBGH: TListBoxGroupHeader;
    ServerLBI: TListBoxItem;
    UserLBI: TListBoxItem;
    ServerEdit: TEdit;
    ClearServerEditBtn: TClearEditButton;
    UserEdit: TEdit;
    ClearUserEditBtn: TClearEditButton;
    UserLayout: TLayout;
    SettingRect: TRectangle;
    UserHeaderTB: TToolBar;
    UserLV: TListView;
    BackUserBtn: TButton;
    RefreshUserBtn: TButton;
    UserHeaderLbl: TLabel;
    UserFA: TFloatAnimation;
    UsersBS: TBindSourceDB;
    SignLB: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    UserPanel: TPanel;
    UserBtn: TButton;
    procedure UserLVItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure UserBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    usersUn: TUsers;
    procedure PanelUserView();
    procedure PanelUserHide();
  public
    { Public declarations }
  end;

var
  SignForm: TSignForm;

implementation

{$R *.fmx}

uses ModuleDataLocal, SConsts;
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.XLgXhdpiTb.fmx ANDROID}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.SSW3.fmx ANDROID}

procedure TSignForm.FormCreate(Sender: TObject);
begin
   AppDataLocal := TAppDataLocal.Create(Self);
   AppDataLocal.ConnectionToLocalDB();
   usersUn := TUsers.Create();
end;

procedure TSignForm.PanelUserHide;
begin
      UserLayout.Visible := False;
      UserFA.Inverse := True;
      UserFA.Start;
end;

procedure TSignForm.PanelUserView;
begin
      UserLayout.Position.Y := Self.Height + 20;
      UserLayout.Visible := True;

      UserFA.Inverse := False;
      UserFA.StartValue := Self.Height  + 20;
      UserFA.Start;
end;

procedure TSignForm.UserBtnClick(Sender: TObject);
begin
  PanelUserView();
end;

procedure TSignForm.UserLVItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  PanelUserHide();
  UserEdit.Text := AItem.Data['Name'].AsString;
end;

end.
