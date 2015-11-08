unit Delphi.SpecificationUtils.TGUID.Factory;

interface

uses
  Delphi.SpecificationUtils,
  Spring.DesignPatterns;

type
  TGUIDSpecificationsFactory = class(TInterfacedObject, IGUIDSpecifications)
  public
    function Equals(const AValue: TGUID): TSpecification<TGUID>; reintroduce;
  end;


implementation

uses
  Delphi.SpecificationUtils.TGUID;

{ TGUIDSpecificationsFactory }

function TGUIDSpecificationsFactory.Equals(const AValue: TGUID): TSpecification<TGUID>;
begin
  Result := TGuidEquals.Create(AValue);
end;

end.
