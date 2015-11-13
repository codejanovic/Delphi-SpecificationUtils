unit Delphi.SpecificationUtils.Reflection.TRttiProperty.Factory;

interface

uses
  Spring.DesignPatterns,
  Delphi.SpecificationUtils,
  System.Rtti;

type
  TReflectionRttiPropertyFactory = class(TInterfacedObject, IReflectionRttiPropertySpecifications)
  public
    function HasAttributeThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiProperty>;
    function HasAttributeType(const AClassOfAttribute: TClass): TSpecification<TRttiProperty>;
    function IsInstanceType: TSpecification<TRttiProperty>;
    function IsManaged: TSpecification<TRttiProperty>;
    function IsInstance: TSpecification<TRttiProperty>;
    function IsOrdinal: TSpecification<TRttiProperty>;
    function IsRecord: TSpecification<TRttiProperty>;
    function IsSet: TSpecification<TRttiProperty>;
    function IsPublicType: TSpecification<TRttiProperty>;
  end;

implementation

uses
  Delphi.SpecificationUtils.Reflection.TRttiProperty;

{ TReflectionRttiPropertyFactory }

function TReflectionRttiPropertyFactory.HasAttributeThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiProperty>;
begin
  Result := TRttiPropertyHasAttribute.Create(ANameSpecification);
end;

function TReflectionRttiPropertyFactory.HasAttributeType(const AClassOfAttribute: TClass): TSpecification<TRttiProperty>;
begin
  Result := TRttiPropertyHasAttributeType.Create(AClassOfAttribute);
end;

function TReflectionRttiPropertyFactory.IsInstance: TSpecification<TRttiProperty>;
begin
  Result := TRttiPropertyTypeIsInstance.Create;
end;

function TReflectionRttiPropertyFactory.IsInstanceType: TSpecification<TRttiProperty>;
begin
  Result := TRttiPropertyIsInstance.Create;
end;

function TReflectionRttiPropertyFactory.IsManaged: TSpecification<TRttiProperty>;
begin
  Result := TRttiPropertyTypeIsManaged.Create;
end;

function TReflectionRttiPropertyFactory.IsOrdinal: TSpecification<TRttiProperty>;
begin
  Result := TRttiPropertyTypeIsOrdinal.Create;
end;

function TReflectionRttiPropertyFactory.IsPublicType: TSpecification<TRttiProperty>;
begin
  Result := TRttiPropertyTypeIsPublicType.Create;
end;

function TReflectionRttiPropertyFactory.IsRecord: TSpecification<TRttiProperty>;
begin
  Result := TRttiPropertyTypeIsRecord.Create;
end;

function TReflectionRttiPropertyFactory.IsSet: TSpecification<TRttiProperty>;
begin
  Result := TRttiPropertyTypeIsSet.Create;
end;

end.
