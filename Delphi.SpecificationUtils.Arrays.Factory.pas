unit Delphi.SpecificationUtils.Arrays.Factory;

interface

uses
  Delphi.SpecificationUtils,
  Spring.DesignPatterns,
  System.Generics.Defaults;

type
  TArraySpecificationsFactory<T> = class(TInterfacedObject, IArraySpecifications<T>)
  public
    function HasLength(const ALength: Integer): TSpecification<TArray<T>>;
    function IsEmpty: TSpecification<TArray<T>>;
    function EqualsInSequence(const AArray: TArray<T>; const AValue: IEqualityComparer<T>): TSpecification<TArray<T>>;
    function Equals(const AArray: TArray<T>; const AValue: IEqualityComparer<T>): TSpecification<TArray<T>>; reintroduce;
    function EqualsInLength(const AArray: TArray<T>): TSpecification<TArray<T>>;
    function Contains(const AItem: T; const AValue: IEqualityComparer<T>): TSpecification<TArray<T>>;
    function ContainsAny(const AItems: TArray<T>; const AValue: IEqualityComparer<T>): TSpecification<TArray<T>>;
  end;

implementation

uses
  Delphi.SpecificationUtils.Arrays;

{ TArraySpecificationsFactory<T> }

function TArraySpecificationsFactory<T>.Contains(
  const AItem: T;
  const AValue: IEqualityComparer<T>): TSpecification<TArray<T>>;
begin
  Result := TArrayContains<T>.Create(AItem, AValue);
end;

function TArraySpecificationsFactory<T>.ContainsAny(
  const AItems: TArray<T>;
  const AValue: IEqualityComparer<T>): TSpecification<TArray<T>>;
begin
  Result := TArrayContainsAny<T>.Create(AItems, AValue);
end;

function TArraySpecificationsFactory<T>.Equals(
  const AArray: TArray<T>;
  const AValue: IEqualityComparer<T>): TSpecification<TArray<T>>;
begin
  Result := TArrayEquals<T>.Create(AArray, AValue);
end;

function TArraySpecificationsFactory<T>.EqualsInLength(const AArray: TArray<T>): TSpecification<TArray<T>>;
begin
  Result := TArrayEqualsInLength<T>.Create(AArray);
end;

function TArraySpecificationsFactory<T>.EqualsInSequence(
  const AArray: TArray<T>;
  const AValue: IEqualityComparer<T>): TSpecification<TArray<T>>;
begin
  Result := TArrayEqualsInSequence<T>.Create(AArray, AValue);
end;

function TArraySpecificationsFactory<T>.HasLength(const ALength: Integer): TSpecification<TArray<T>>;
begin
  Result := TArrayHasLength<T>.Create(ALength);
end;

function TArraySpecificationsFactory<T>.IsEmpty: TSpecification<TArray<T>>;
begin
  Result := TArrayIsEmpty<T>.Create;
end;

end.
