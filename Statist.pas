unit Statist;

interface

uses ModuleDataLocal, SConsts, System.SysUtils, Globals, Interfaces;

type
  TStatist = class(TInterfacedObject, IInterfaceMove)

  public
    procedure Add;                     // ��� ������ ��������� ���������� �� ���������� �����������
    procedure Delete;                  // ������� ������ ����������
    procedure Get;overload;            // ��������� ���������� � ��������� ������� �� ��������� ���������� ���������
    class procedure Get(CollectorUID: integer);overload;

    constructor Create();
  end;

implementation


{ TStatist }

procedure TStatist.Add;
begin
   //todo -opmp: ��������� ���������� �� ��������� ���������� � ���������� �������
end;

constructor TStatist.Create;
begin
  Inherited Create();
   Get();
end;

procedure TStatist.Delete;
begin
  //
end;

class procedure TStatist.Get(CollectorUID: integer);
begin
  //TODO -opmp: �������� ������ ��������� ��������� ���������
  try
    AppDataLocal.CollectorOrders.SQL.Text := (Format(SSQLGetCollectorOrders, [CollectorUID]));
    AppDataLocal.CollectorOrders.Active := True;
  except
    AppDataLocal.CollectorOrders.Active := False;
  end;
end;

procedure TStatist.Get;
begin
  try
    AppDataLocal.CollectorBuild.Active := False;
    AppDataLocal.CollectorBuild.SQL.Text := Format(SSQLGetCollectCountOrders, [FormatDateTime('yyyy-mm-dd', DatesLocal.DBeg),
                                                                               FormatDateTime('yyyy-mm-dd',DatesLocal.DEnd)]);
    AppDataLocal.CollectorBuild.Active := True;
  except
  end;

end;

end.
