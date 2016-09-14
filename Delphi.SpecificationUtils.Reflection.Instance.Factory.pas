unit Delphi.SpecificationUtils.Reflection.Instance.Factory;

interface

uses
  Spring,
  Spring.DesignPatterns,
  Delphi.SpecificationUtils;

type
  TReflectionInstanceFactory = class(TInterfacedObject, IReflectionObjectSpecifications)
  public
    function HasMemberThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
    function HasPropertyThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
    function HasFieldThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
    function HasMethodThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
    function HasAttributeThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
    function HasAttributeType(const AClassOfAttribute: TAttributeClass): TSpecification<TObject>;
  end;

implementation

uses
  Delphi.SpecificationUtils.Reflection.Instance;

{ TReflectionObjectsFactory }

function TReflectionInstanceFactory.HasAttributeThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
begin
  Result := TObjectHasAttribute.Create(ANameSpecification);
end;

function TReflectionInstanceFactory.HasAttributeType(const AClassOfAttribute: TAttributeClass): TSpecification<TObject>;
begin
  Result := TObjectHasAttributeType.Create(AClassOfAttribute);
end;

function TReflectionInstanceFactory.HasFieldThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
begin
  Result := TObjectHasField.Create(ANameSpecification);
end;

function TReflectionInstanceFactory.HasMemberThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
begin
  Result := TObjectHasMember.Create(ANameSpecification);
end;

function TReflectionInstanceFactory.HasMethodThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
begin
  Result := TObjectHasMethod.Create(ANameSpecification);
end;

function TReflectionInstanceFactory.HasPropertyThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
begin
  Result := TObjectHasProperty.Create(ANameSpecification);
end;

end.
