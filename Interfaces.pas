unit Interfaces;

interface

type
  IInterfaceMove = interface(IUnknown)
    ['{460EAE1F-5D00-49EF-84EA-E19D14F314A9}']
    procedure Add();
    procedure Delete();
    procedure Get();
  end;

implementation

end.
