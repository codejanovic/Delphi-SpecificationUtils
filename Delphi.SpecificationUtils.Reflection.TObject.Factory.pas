unit Delphi.SpecificationUtils.Reflection.TObject.Factory;

interface

uses
  Spring.DesignPatterns,
  Delphi.SpecificationUtils;

type
  TReflectionObjectsFactory = class(TInterfacedObject, IReflectionObjectSpecifications)
  public
    function HasMemberThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
    function HasPropertyThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
    function HasFieldThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
    function HasMethodThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
    function HasAttributeThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
    function HasAttributeType(const AClassOfAttribute: TClass): TSpecification<TObject>;
  end;

implementation

uses
  Delphi.SpecificationUtils.Reflection.TObject;

{ TReflectionObjectsFactory }

function TReflectionObjectsFactory.HasAttributeThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
begin
  Result := TObjectHasAttribute.Create(ANameSpecification);
end;

function TReflectionObjectsFactory.HasAttributeType(const AClassOfAttribute: TClass): TSpecification<TObject>;
begin
  Result := TObjectHasAttributeType.Create(AClassOfAttribute);
end;

function TReflectionObjectsFactory.HasFieldThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
begin
  Result := TObjectHasField.Create(ANameSpecification);
end;

function TReflectionObjectsFactory.HasMemberThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
begin
  Result := TObjectHasMember.Create(ANameSpecification);
end;

function TReflectionObjectsFactory.HasMethodThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
begin
  Result := TObjectHasMethod.Create(ANameSpecification);
end;

function TReflectionObjectsFactory.HasPropertyThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
begin
  Result := TObjectHasProperty.Create(ANameSpecification);
end;

end.
