unit JsonableObject;

interface
uses
  XSuperObject, System.Classes, System.SysUtils, System.Generics.Collections;
type
  TStringArray=TArray<string>;
  {
  When we serialize List:TObjectList<TMyObject> it saves too many garbage fields
  To keep JSON clear let's declare temp _List:TArray<TMyObject>
  and use it as a read/write buffer
  Then you need to move items from one to another in overrided methods BeforeSave and AfterLoad
  [DISABLE]
  List: TObjectList<TMyObject>;
  [Alias['List']
  _List:TArray<TMyObject>;

  procedure AfterLoad(X:ISuperObject); virtual;
  begin
    ArrayToList<TMyObject>(_List,List)
  end;

  procedure BeforeSave(X:ISuperObject); virtual;
  begin
    ListToArray<TMyObject>(List,_List);
  end;
  }
  TJsonableObject = class(TObject)
  private
  protected
    fs:TFormatSettings;
    function StrToCurr(const s:string):Currency;
    function CurrToStr(c:currency):string;

    function StrToBool(const s:string):boolean;
    function BoolToStr(b:boolean):string;

    function BoolToInt(b:boolean):integer;
    function IntToBool(n:integer):boolean;
  public
    [DISABLE]
    FileName:string;
    function AsJsonObj:ISuperObject; virtual;
    // indent = true - pretty print. false - single string
    function AsString(indent:Boolean = false):string; overload;

    procedure LoadFromJSON(const S:string); overload; virtual;
    procedure LoadFromJSON(x:ISuperObject); overload; virtual;
    procedure LoadFromFile(const FName: string; Encoding:TEncoding=NIL); virtual;

    procedure BeforeSave(X:ISuperObject); virtual;
    procedure AfterLoad(X:ISuperObject); virtual;

    class procedure ArrayToList<T:Class>(var arr:TArray<T>; lst:TObjectList<T>); overload;
    class procedure ArrayToList(var arr:TStringArray; lst:TStringList); overload;

    class procedure ListToArray(lst:TStringList; var arr:TStringArray); overload;
    class procedure ListToArray<T:Class>(lst:TObjectList<T>; var arr:TArray<T>); overload;

    procedure SaveToFile(const FName: string=''; Encoding:TEncoding=nil); overload; virtual;
    constructor Create; virtual;
    constructor CreateFromFile(const fname:string; Encoding:TEncoding=nil); virtual;
    constructor CreateFromJSON(const JSON:string); overload;
    constructor CreateFromJSON(x:ISuperObject); overload;

    class function Unescape(const s:string):string;
  end;

implementation


{ TJsonableObject }

class procedure TJsonableObject.ArrayToList<T>(var arr: TArray<T>; lst: TObjectList<T>);
var
  i: Integer;
begin
  lst.Clear;
  for i := 0 to High(arr) do
    lst.Add(arr[i]);
  setlength(arr,0);
end;

class procedure TJsonableObject.ArrayToList(var arr:TStringArray; lst:TStringList);
var
  i: Integer;
begin
  lst.Clear;
  for i := 0 to High(arr) do
    lst.Add(arr[i]);
  setlength(arr,0);
end;

class procedure TJsonableObject.ListToArray(lst:TStringList; var arr:TStringArray);
var
  i:integer;
begin
  setLength(arr,lst.Count);
  for i:=0 to lst.Count-1 do
    arr[i]:=lst[i];
end;

class procedure TJsonableObject.ListToArray<T>(lst: TObjectList<T>; var arr: TArray<T>);
var
  i:integer;
begin
  setLength(arr,lst.Count);
  for i:=0 to lst.Count-1 do
    arr[i]:=lst[i];
end;


procedure TJsonableObject.AfterLoad(X:ISuperObject);
begin

end;


function TJsonableObject.AsJsonObj: ISuperObject;
begin
  result:=  AsJSONObject;
end;

function TJsonableObject.AsString(indent: Boolean): string;
begin
  result := Unescape( AsJSON(indent,False) );
end;

procedure TJsonableObject.BeforeSave(X:ISuperObject);
begin

end;

constructor TJsonableObject.Create;
begin
  inherited Create;
  fs := TFormatSettings.Create();
  fs.DecimalSeparator := '.';
end;

constructor TJsonableObject.CreateFromJSON(const JSON:string);
begin
  Create;
  LoadFromJSON(JSON);
end;

constructor TJsonableObject.CreateFromFile(const fname:string; Encoding:TEncoding=NIL);
var L:TStreamReader;
  s:string;
begin
  if Encoding=NIL then
    Encoding:=TEncoding.UTF8;

  if FileExists(Fname) then
  begin
    FileName := fname;
    L:= TStreamReader.Create(fname, Encoding);
    try
      s:=l.ReadToEnd;
      CreateFromJSON(s);
    finally
      L.Free;
    end;
  end
  else
    raise Exception.Create('File not found');
end;

constructor TJsonableObject.CreateFromJSON(x: ISuperObject);
begin
  Create;
  LoadFromJSON(x);
end;

procedure TJsonableObject.LoadFromJSON(const S: string);
begin
  LoadFromJSON(so(s));
end;

procedure TJsonableObject.LoadFromJSON(x: ISuperObject);
begin
  Self.AssignFromJSON(X);
  AfterLoad(X);
end;


procedure TJsonableObject.SaveToFile(const FName: string = ''; Encoding:TEncoding=nil);
var L:TStreamWriter;
  s:string;
  fn:string;
  X:ISuperObject;
begin
  if Encoding=NIL then
    Encoding:=TEncoding.UTF8;

  if (FName='') then
  begin
    if filename='' then
      filename:=ChangeFileExt(ParamStr(0),'.json');
    FN:=Filename;
  end
  else
    FN:=FName;
  L:= TStreamWriter.Create(FN,False,Encoding);
  try
    x:=AsJsonObject;
    BeforeSave(X);
    s:=Unescape(x.AsJSON(True));
    l.Write(s);
  finally
    l.Free;
  end;
end;

class function TJsonableObject.Unescape(const s: string): string;
var
  i:Integer;
begin
  Result := s;
  i:=pos('\u',result);
  while i>0 do
  begin
    result:=Copy(result,1,i-1) + Char(StrToIntDef('$'+Copy(result,i+2,4),32))+copy(result,i+6, Length(result));
    i:=pos('\u',result);
  end;
end;

procedure TJsonableObject.LoadFromFile(const FName: string; Encoding:TEncoding=NIL);
var L:TStreamReader;
  s:string;
  fn:string;
begin
  if Encoding=nil then
    Encoding := TEncoding.UTF8;

  if FName='' then
    fn:=ChangeFileExt(ParamStr(0),'.json')
  else
    fn:=FName;
  if FileExists(fn) then
  begin
    L:= TStreamReader.Create(fn, Encoding);
    try
      s:=l.ReadToEnd;
      LoadFromJSON(s);
      filename:=fname;
    finally
      L.Free;
    end;
  end;
end;


function TJsonableObject.StrToCurr(const s:string):Currency;
begin
  Result := System.sysutils.StrToCurr(s, fs);
end;

function TJsonableObject.CurrToStr(c:currency):string;
begin
  Result := System.sysutils.CurrToStr(c, fs);
end;

function TJsonableObject.StrToBool(const s:string):boolean;
begin
  result := s = '1';
end;

function TJsonableObject.BoolToStr(b:boolean):string;
begin
  if b then
    Result := '1'
  else
    Result := '0';
end;

function TJsonableObject.BoolToInt(b:boolean):integer;
begin
  if b then
    Result := 1
  else
    Result := 0;
end;

function TJsonableObject.IntToBool(n:integer):Boolean;
begin
  result := n=1;
end;

end.
