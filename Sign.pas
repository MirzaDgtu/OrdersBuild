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
    UserRect: TRectangle;
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
    SettingLayout: TLayout;
    SettingRect: TRectangle;
    SettingHeaderTB: TToolBar;
    BackSettingBtn: TButton;
    SaveSettingBtn: TButton;
    SettingHeaderLbl: TLabel;
    SettingLB: TListBox;
    SettingParamLBGH: TListBoxGroupHeader;
    ServerSettingParamLBI: TListBoxItem;
    DataBaseSettingParamLBI: TListBoxItem;
    LoginSettingParamLBI: TListBoxItem;
    PasswordSettingParamLBI: TListBoxItem;
    ServerSettingParamEdit: TEdit;
    DataBaseSettingParamEdit: TEdit;
    LoginSettingParamEdit: TEdit;
    PasswordSettingParamEdit: TEdit;
    ClearServerSettingParamEBtn: TClearEditButton;
    ClearDataBaseSettingParamEditBtn: TClearEditButton;
    ClearLoginSettingParamBtn: TClearEditButton;
    CleaPasswordSettingParamBtn: TClearEditButton;
    PasswordPanelBtn: TPanel;
    ViewPasswordBtn: TSpeedButton;
    SettingFA: TFloatAnimation;
    PortParamSettingLBI: TListBoxItem;
    PortParamSettingEdit: TEdit;
    ClearParamSettingBtn: TClearEditButton;
    procedure UserLVItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure UserBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DefaultSBtnClick(Sender: TObject);
    procedure ViewPasswordBtnClick(Sender: TObject);
    procedure SettingParamSBtnClick(Sender: TObject);
    procedure BackSettingBtnClick(Sender: TObject);
  private
    { Private declarations }
    usersUn: TUsers;
    procedure PanelUserView();
    procedure PanelUserHide();
    procedure PanelSettingView();
    procedure PanelSettingHide();
  public
    { Public declarations }
  end;

var
  SignForm: TSignForm;

implementation

{$R *.fmx}

uses ModuleDataLocal, SConsts, Globals;
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.XLgXhdpiTb.fmx ANDROID}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.SSW3.fmx ANDROID}

procedure TSignForm.BackSettingBtnClick(Sender: TObject);
begin
   PanelSettingHide();
end;

procedure TSignForm.DefaultSBtnClick(Sender: TObject);
begin
    ShowMessage((CurrentUser.ID).ToString + ' ' + CurrentUser.Login + ' ' + CurrentUser.Name);
end;

procedure TSignForm.FormCreate(Sender: TObject);
begin
   AppDataLocal := TAppDataLocal.Create(Self);
   AppDataLocal.ConnectionToLocalDB();
   usersUn := TUsers.Create();
   UserEdit.Text := CurrentUser.Name;
end;

procedure TSignForm.PanelSettingHide;
begin
      SettingLayout.Visible := False;
      UserFA.Inverse := True;
      UserFA.Start;
end;

procedure TSignForm.PanelSettingView;
begin
      SettingLayout.Position.Y := Self.Height + 20;
      SettingLayout.Visible := True;

      SettingFA.Inverse := False;
      SettingFA.StartValue := Self.Height  + 20;
      SettingFA.Start;
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

procedure TSignForm.SettingParamSBtnClick(Sender: TObject);
begin
  PanelSettingView();
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

  usersUn.SetCurrentuser((AItem.Data['ID'].AsString).toInteger,
                          AItem.Data['Login'].AsString,
                          AItem.Data['Name'].AsString);
  if (AppDataLocal.Users.Active) and
     (not AppDataLocal.Users.IsEmpty) then
      if AppDataLocal.Users.Locate('LastUser', '1', []) then

       usersUn.UpdatelastUser(AppDataLocal.Users.FieldByName('ID').AsInteger, 0); // ѕрисвоение последнему пользователю статуса 0

  usersUn.UpdatelastUser(CurrentUser.ID, 1); // ѕрисвоение новому пользователю 1
  usersUn.Get();
end;

procedure TSignForm.ViewPasswordBtnClick(Sender: TObject);
begin
    PasswordSettingParamEdit.Password := not(PasswordSettingParamEdit.Password);
end;

end.
