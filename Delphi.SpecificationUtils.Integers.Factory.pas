unit Delphi.SpecificationUtils.Integers.Factory;

interface

uses
  Delphi.SpecificationUtils,
  Spring.DesignPatterns;

type
  TIntegerSpecificationsFactory = class(TInterfacedObject, IIntegerSpecifications)
  public
    function IsGreaterThan(const AValue: Integer): TSpecification<Integer>;
    function IsLessThan(const AValue: Integer): TSpecification<Integer>;
    function IsBetween(const ALeft: Integer; const ARight: Integer): TSpecification<Integer>;
    function Equals(const AValue: Integer): TSpecification<Integer>; reintroduce;
  end;

implementation

uses
  Delphi.SpecificationUtils.Integers;

{ TIntegerSpecificationsFactory }

function TIntegerSpecificationsFactory.Equals(const AValue: Integer): TSpecification<Integer>;
begin
  Result := TIntegerEquals.Create(AValue);
end;

function TIntegerSpecificationsFactory.IsBetween(const ALeft, ARight: Integer): TSpecification<Integer>;
begin
  Result := IsGreaterThan(ALeft) and IsLessThan(ARight);
end;

function TIntegerSpecificationsFactory.IsGreaterThan(const AValue: Integer): TSpecification<Integer>;
begin
  Result := TIntegerIsGreaterThan.Create(AValue);
end;

function TIntegerSpecificationsFactory.IsLessThan(const AValue: Integer): TSpecification<Integer>;
begin
  Result := TIntegerIsLessThan.Create(AValue);
end;

end.
