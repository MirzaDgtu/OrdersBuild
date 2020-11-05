unit Exchanger;

interface

uses System.SysUtils;

type
  TExcangerNakl = class     /// ����� ������ ����������� � ��������� ��������
   private
    FEndD: TDate;
    FBegD: TDate;
    FReestr: string;
    procedure SetBegD(const Value: TDate);
    procedure SetEndD(const Value: TDate);
    procedure SetReestr(const Value: string);

   public
    procedure getNaklRemote(DBeg, DEnd: TDate; Reestr: string);           // ��������� ���������� � ���������� �������
    procedure getNaklLocal(DBeg, DEnd: TDate); overload;                  // ��������� ���������� � ���������� �������
    procedure getNaklLocal(DBeg, DEnd: TDate; Build: smallint); overload; // ��������� ���������� � ���������� �������
    procedure getNaklDetailRemote(UnicumNum: integer);          // ��������� ����������� ��������� � ���������� �������
    procedure getNaklDetailLocal(UnicumNum: integer);           // ��������� ����������� ��������� � ���������� �������

    procedure clearNaklHeadLocal();                             // ������� ����� ��������� ��������� ���� ������
    procedure clearNaklMoveLocal();                             // ������� ����������� ��������� ��������� ���� ������

    procedure addNaklHeadRemoteToLocal();                       // ���������� ���������� � ��������� �� ���������� � ���������� �������
    procedure addNaklMoveRemoteToLocal(UnicumNum: integer);     // ���������� ����������� ��������� � ��������� �� ���������� � ���������� �������

    procedure pushNaklHeadLocalToRemote(); overload;                   // ����������� ��������� ���������� � ��������� �� �� ��������� ������
    procedure pushNaklHeadLocalToRemote(UnicumNum: integer); overload; // ����������� ���������� ��������� � ��������� �� �� ��������� ������
    procedure pushNaklMoveLocalToRemote(UnicumNum: integer);           // ����������� ����������� ��������� � ��������� �� �� ��������� ������

    constructor Create(DBeg, DEnd: TDate; Reestr: string); overload;
   published
     property BegD: TDate read FBegD write SetBegD;
     property EndD: TDate read FEndD write SetEndD;
     property Reestr: string read FReestr write SetReestr;
  end;

implementation

uses SConsts, Globals, ModuleDataLocal, ModuleDataRemote;

{ TExcangerNakl }

procedure TExcangerNakl.addNaklHeadRemoteToLocal;
begin

end;

procedure TExcangerNakl.addNaklMoveRemoteToLocal(UnicumNum: integer);
begin

end;

procedure TExcangerNakl.clearNaklHeadLocal;
begin

end;

procedure TExcangerNakl.clearNaklMoveLocal;
begin

end;

constructor TExcangerNakl.Create(DBeg, DEnd: TDate; Reestr: string);
begin
  inherited;
  Self.BegD := DBeg;
  Self.EndD := DEnd;
  Self.Reestr := Reestr;
end;

procedure TExcangerNakl.getNaklDetailLocal(UnicumNum: integer);
begin

end;

procedure TExcangerNakl.getNaklDetailRemote(UnicumNum: integer);
begin

end;

procedure TExcangerNakl.getNaklLocal(DBeg, DEnd: TDate; Build: smallint);
begin

end;

procedure TExcangerNakl.getNaklLocal(DBeg, DEnd: TDate);
begin

end;

procedure TExcangerNakl.getNaklRemote(DBeg, DEnd: TDate; Reestr: string);
begin

end;

procedure TExcangerNakl.pushNaklHeadLocalToRemote(UnicumNum: integer);
begin

end;

procedure TExcangerNakl.pushNaklHeadLocalToRemote;
begin

end;

procedure TExcangerNakl.pushNaklMoveLocalToRemote(UnicumNum: integer);
begin

end;

procedure TExcangerNakl.SetBegD(const Value: TDate);
begin
  FBegD := Value;
end;

procedure TExcangerNakl.SetEndD(const Value: TDate);
begin
  FEndD := Value;
end;

procedure TExcangerNakl.SetReestr(const Value: string);
begin
  FReestr := Value;
end;

end.
