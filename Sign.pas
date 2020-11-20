unit Sign;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, System.ImageList, FMX.ImgList, FMX.Controls.Presentation,
  FMX.Edit, FMX.ListBox, FMX.Objects, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.Ani, Users,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, ConnectRemove, DataBaseLocal;

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
    UserEdit: TEdit;
    UserLayout: TLayout;
    UserRect: TRectangle;
    UserHeaderTB: TToolBar;
    UserLV: TListView;
    BackUserBtn: TButton;
    RefreshUserBtn: TButton;
    UserHeaderLbl: TLabel;
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
    SignBL: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    UserFA: TFloatAnimation;
    UsersBS: TBindSourceDB;
    UserBottomSB: TStatusBar;
    UserCountLbl: TLabel;
    procedure UserLVItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure UserBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DefaultSBtnClick(Sender: TObject);
    procedure ViewPasswordBtnClick(Sender: TObject);
    procedure SettingParamSBtnClick(Sender: TObject);
    procedure BackSettingBtnClick(Sender: TObject);
    procedure SaveSettingBtnClick(Sender: TObject);
    procedure SignSBtnClick(Sender: TObject);
    procedure BackUserBtnClick(Sender: TObject);
    procedure RefreshUserBtnClick(Sender: TObject);
    procedure UserEditClick(Sender: TObject);
  private
    { Private declarations }
    usersUn: TUsers;
    connectUn: TConnectRemove;
    
    procedure PanelUserView();
    procedure PanelUserHide();
    procedure PanelSettingView();
    procedure PanelSettingHide();

    procedure getDefaultSetting();
    procedure setUserBottomSBInfo();
  public
    { Public declarations }
  end;

var
  SignForm: TSignForm;

implementation

{$R *.fmx}

uses SConsts, Globals, Orders, ModuleDataRemote, ModuleDataLocal, WifiConnect;
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.XLgXhdpiTb.fmx ANDROID}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.SSW3.fmx ANDROID}

procedure TSignForm.BackSettingBtnClick(Sender: TObject);
begin
   PanelSettingHide();
end;

procedure TSignForm.BackUserBtnClick(Sender: TObject);
begin
   PanelUserHide();
end;

procedure TSignForm.DefaultSBtnClick(Sender: TObject);
//var
//   dbLocal: TLocalDataBase;
begin
//   dbLocal := TLocalDataBase.Create;
  {
   try
     dbLocal.Delete;
   finally
     dbLocal.Free;
   end;}
end;

procedure TSignForm.FormCreate(Sender: TObject);
begin
   AppDataLocal := TAppDataLocal.Create(Self);
   AppDataRemote := TAppDataRemote.Create(Self);
  // {$IFDEF ANDROID}
      wifiConnect1 := TWifiConnect.Create();
  // {$ENDIF}

   AppDataLocal.ConnectionToLocalDB();
   usersUn := TUsers.Create();
   connectUn := TConnectRemove.Create(ConnectLocal);
   getDefaultSetting();
end;

procedure TSignForm.getDefaultSetting;
begin
   UserEdit.Text := CurrentUser.Name; // Пользователь

   // Параметры для подключения к удаленному серверу
   ServerSettingParamEdit.Text := ConnectLocal.Sever;
   DataBaseSettingParamEdit.Text := ConnectLocal.InitialCatalog;
   LoginSettingParamEdit.Text := ConnectLocal.login;
   PasswordSettingParamEdit.Text := ConnectLocal.Password;
   PortParamSettingEdit.Text := (ConnectLocal.Port).ToString
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
      UserLayout.Position.Y := Self.Height + 20; //MainLayout.Height + 20;
      UserLayout.Visible := True;

      UserFA.Inverse := False;
      UserFA.StartValue :=  Self.Height + 20; // MainLayout.Height + 20;
      UserFA.Start;
end;

procedure TSignForm.RefreshUserBtnClick(Sender: TObject);
begin
     try
       usersUn.Update();
     finally
       TUsers.Get();
       setUserBottomSBInfo();
     end;
end;

procedure TSignForm.SaveSettingBtnClick(Sender: TObject);
begin
  try
    if Length(Trim(ServerSettingParamEdit.Text)) > 0 then
      connectUn.Add(Trim(ServerSettingParamEdit.Text),
                    Trim(DataBaseSettingParamEdit.Text),
                    Trim(LoginSettingParamEdit.Text),
                    Trim(PasswordSettingParamEdit.Text),
                    (Trim(PortParamSettingEdit.Text)).toInteger);
   connectUn.Get(ConnectLocal);
  finally
    PanelSettingHide();
  end;
end;

procedure TSignForm.SettingParamSBtnClick(Sender: TObject);
begin
  PanelSettingView();
end;

procedure TSignForm.setUserBottomSBInfo;
begin
  if AppDataLocal.Users.Active then
    UserCountLbl.Text := Format('Пользователей: %d', [AppDataLocal.Users.RecordCount]);
end;

procedure TSignForm.SignSBtnClick(Sender: TObject);
var
    OrdersF: TOrdersForm;
begin
    OrdersF := TOrdersForm.Create(Self);
    OrdersF.TabsOrder.ActiveTab := OrdersF.OrdersTab;
    {$IFDEF ANDROID}
       OrdersF.ShowModal(procedure(ModalResult: TModalResult)
                         Begin
                         End);
    {$ENDIF}

    {$IFDEF MSWINDOWS}
      OrdersF.ShowModal();
    {$ENDIF}
end;

procedure TSignForm.UserBtnClick(Sender: TObject);
begin
//  PanelUserView();
end;

procedure TSignForm.UserEditClick(Sender: TObject);
begin
  setUserBottomSBInfo();
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

       usersUn.UpdatelastUser(AppDataLocal.Users.FieldByName('ID').AsInteger, 0); // Присвоение последнему пользователю статуса 0

  usersUn.UpdatelastUser(CurrentUser.ID, 1); // Присвоение новому пользователю 1
  usersUn.Get();
end;

procedure TSignForm.ViewPasswordBtnClick(Sender: TObject);
begin
    PasswordSettingParamEdit.Password := not(PasswordSettingParamEdit.Password);
end;

end.
