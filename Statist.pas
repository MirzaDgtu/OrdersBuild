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
  //DONE -opmp: �������� ������ ��������� ��������� ���������
  try
    AppDataLocal.CollectorOrders.SQL.Text := (Format(SSQLGetCollectorOrdersOH, [CollectorUID]));
    AppDataLocal.CollectorOrders.Active := True;
  except
    AppDataLocal.CollectorOrders.Active := False;
  end;
end;

procedure TStatist.Get;
begin
  try
    AppDataLocal.CollectorBuild.Active := False;
    AppDataLocal.CollectorBuild.SQL.Text := SSQLGetCollectCountOrdersHead;
    AppDataLocal.CollectorBuild.Active := True;
  except
    AppDataLocal.CollectorBuild.Active := False;
  end;
end;

end.
