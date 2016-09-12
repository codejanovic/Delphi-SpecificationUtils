unit Delphi.SpecificationUtils.Reflection.TRttiMember.Factory;

interface

uses
  Spring,
  Spring.DesignPatterns,
  Delphi.SpecificationUtils,
  System.Rtti;

type
  TReflectionRttiMemberFactory = class(TInterfacedObject, IReflectionRttiMemberSpecifications)
  public
    function HasAttributeThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiMember>;
    function HasAttributeType(const AClassOfAttribute: TAttributeClass): TSpecification<TRttiMember>;
    function HasVisibility(const AVisibilities: TMemberVisibilities): TSpecification<TRttiMember>;
  end;

implementation

uses
  Delphi.SpecificationUtils.Reflection.TRttiMember;

{ TReflectionRttiMemberFactory }

function TReflectionRttiMemberFactory.HasAttributeThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiMember>;
begin
  Result := TRttiMemberHasAttribute.Create(ANameSpecification);
end;

function TReflectionRttiMemberFactory.HasAttributeType(const AClassOfAttribute: TAttributeClass): TSpecification<TRttiMember>;
begin
  Result := TRttiMemberHasAttributeType.Create(AClassOfAttribute);
end;

function TReflectionRttiMemberFactory.HasVisibility(const AVisibilities: TMemberVisibilities): TSpecification<TRttiMember>;
begin
  Result := TRttiMemberHasVisibility.Create(AVisibilities);
end;

end.
