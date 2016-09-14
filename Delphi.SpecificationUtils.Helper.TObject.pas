unit Delphi.SpecificationUtils.Helper.TObject;

interface

uses
  Rtti;

type
  TSpecificationTObjectHelper = class helper for TObject
    function GetType: TRttiType;
  end;

implementation

uses
  Spring,
  Spring.Reflection;

{ TSpecificationTObjectHelper }

function TSpecificationTObjectHelper.GetType: TRttiType;
begin
  Result := TType.GetType(ClassInfo);
end;

end.
