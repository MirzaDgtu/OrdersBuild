unit Statist;

interface

uses ModuleDataLocal, SConsts, System.SysUtils, Globals, Interfaces;

type
  TStatist = class(TInterfacedObject, IInterfaceMove)

  public
    procedure Add;                     // для случая получения информации из удаленного репозитория
    procedure Delete;                  // Очистка списка статистики
    procedure Get;overload;            // Получение статистики с локальной таблицу по собранным документам сборщиков
    class procedure Get(CollectorUID: integer);overload;

    constructor Create();
  end;

implementation


{ TStatist }

procedure TStatist.Add;
begin
   //todo -opmp: Получение статистики по собранным документам с удаленного сервера
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
  //TODO -opmp: Получить список собранных накладных сборщиком
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
