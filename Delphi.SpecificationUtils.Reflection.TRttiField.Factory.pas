unit Delphi.SpecificationUtils.Reflection.TRttiField.Factory;

interface

uses
  Spring.DesignPatterns,
  Delphi.SpecificationUtils,
  System.Rtti;

type
  TReflectionRttiFieldFactory = class(TInterfacedObject, IReflectionRttiFieldSpecifications)
  public
    function HasAttributeThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiField>;
    function HasAttributeType(const AClassOfAttribute: TClass): TSpecification<TRttiField>;
    function IsManaged: TSpecification<TRttiField>;
    function IsInstance: TSpecification<TRttiField>;
    function IsOrdinal: TSpecification<TRttiField>;
    function IsRecord: TSpecification<TRttiField>;
    function IsSet: TSpecification<TRttiField>;
    function IsPublicType: TSpecification<TRttiField>;
  end;

implementation

uses
  Delphi.SpecificationUtils.Reflection.TRttiField;

{ TReflectionRttiFieldFactory }

function TReflectionRttiFieldFactory.HasAttributeThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiField>;
begin
  Result := TRttiFieldHasAttribute.Create(ANameSpecification);
end;

function TReflectionRttiFieldFactory.HasAttributeType(const AClassOfAttribute: TClass): TSpecification<TRttiField>;
begin
  Result := TRttiFieldHasAttributeType.Create(AClassOfAttribute);
end;

function TReflectionRttiFieldFactory.IsInstance: TSpecification<TRttiField>;
begin
  Result := TRttiFieldTypeIsInstance.Create;
end;

function TReflectionRttiFieldFactory.IsManaged: TSpecification<TRttiField>;
begin
  Result := TRttiFieldTypeIsManaged.Create;
end;

function TReflectionRttiFieldFactory.IsOrdinal: TSpecification<TRttiField>;
begin
  Result := TRttiFieldTypeIsOrdinal.Create;
end;

function TReflectionRttiFieldFactory.IsPublicType: TSpecification<TRttiField>;
begin
  Result := TRttiFieldTypeIsPublicType.Create;
end;

function TReflectionRttiFieldFactory.IsRecord: TSpecification<TRttiField>;
begin
  Result := TRttiFieldTypeIsRecord.Create;
end;

function TReflectionRttiFieldFactory.IsSet: TSpecification<TRttiField>;
begin
  Result := TRttiFieldTypeIsSet.Create;
end;

end.
