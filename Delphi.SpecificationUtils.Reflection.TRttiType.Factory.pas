unit Delphi.SpecificationUtils.Reflection.TRttiType.Factory;

interface

uses
  Spring,
  Spring.DesignPatterns,
  Delphi.SpecificationUtils,
  System.Rtti;

type
  TReflectionRttiTypeFactory = class(TInterfacedObject, IReflectionRttiTypeSpecifications)
  public
    function HasMemberThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiType>;
    function HasPropertyThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiType>;
    function HasFieldThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiType>;
    function HasMethodThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiType>;
    function HasAttributeThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiType>;
    function HasAttributeType(const AClassOfAttribute: TAttributeClass): TSpecification<TRttiType>;
    function IsManaged: TSpecification<TRttiType>;
    function IsInstance: TSpecification<TRttiType>;
    function IsOrdinal: TSpecification<TRttiType>;
    function IsRecord: TSpecification<TRttiType>;
    function IsSet: TSpecification<TRttiType>;
    function IsPublicType: TSpecification<TRttiType>;
    function IsInstanceType: TSpecification<TRttiType>;
  end;

implementation

uses
  Delphi.SpecificationUtils.Reflection.TRttiType;

{ TReflectionRttiTypeFactory }

function TReflectionRttiTypeFactory.HasAttributeThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiType>;
begin
	Result := TRttiTypeHasAttribute.Create(ANameSpecification);
end;

function TReflectionRttiTypeFactory.HasAttributeType(const AClassOfAttribute: TAttributeClass): TSpecification<TRttiType>;
begin
	Result := TRttiTypeHasAttributeType.Create(AClassOfAttribute);
end;

function TReflectionRttiTypeFactory.HasFieldThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiType>;
begin
	Result := TRttiTypeHasField.Create(ANameSpecification);
end;

function TReflectionRttiTypeFactory.HasMemberThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiType>;
begin
	Result := TRttiTypeHasMember.Create(ANameSpecification);
end;

function TReflectionRttiTypeFactory.HasMethodThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiType>;
begin
	Result := TRttiTypeHasMethod.Create(ANameSpecification);
end;

function TReflectionRttiTypeFactory.HasPropertyThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiType>;
begin
	Result := TRttiTypeHasProperty.Create(ANameSpecification);
end;

function TReflectionRttiTypeFactory.IsInstance: TSpecification<TRttiType>;
begin
	Result := TRttiTypeIsInstance.Create;
end;

function TReflectionRttiTypeFactory.IsInstanceType: TSpecification<TRttiType>;
begin
	Result := TRttiTypeIsInstanceType.Create;
end;

function TReflectionRttiTypeFactory.IsManaged: TSpecification<TRttiType>;
begin
	Result := TRttiTypeIsManaged.Create;
end;

function TReflectionRttiTypeFactory.IsOrdinal: TSpecification<TRttiType>;
begin
	Result := TRttiTypeIsOrdinal.Create;
end;

function TReflectionRttiTypeFactory.IsPublicType: TSpecification<TRttiType>;
begin
	Result := TRttiTypeIsPublicType.Create;
end;

function TReflectionRttiTypeFactory.IsRecord: TSpecification<TRttiType>;
begin
	Result := TRttiTypeIsRecord.Create;
end;

function TReflectionRttiTypeFactory.IsSet: TSpecification<TRttiType>;
begin
	Result := TRttiTypeIsSet.Create;
end;

end.
