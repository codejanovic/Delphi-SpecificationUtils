unit Delphi.SpecificationUtils.Reflection.TRttiNamedObject.Factory;

interface

uses
  Spring.DesignPatterns,
  Delphi.SpecificationUtils,
  System.Rtti;

type

  TReflectionRttiNamedObjectFactory = class(TInterfacedObject, IReflectionRttiNamedObjectSpecifications)
  public
    function HasNameThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiNamedObject>;
  end;

implementation

uses
  Delphi.SpecificationUtils.Reflection.TRttiNamedObject;

{ TReflectionRttiNamedObjectFactory }

function TReflectionRttiNamedObjectFactory.HasNameThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiNamedObject>;
begin
  Result := TRttiNamedObjectHasName.Create(ANameSpecification);
end;

end.
