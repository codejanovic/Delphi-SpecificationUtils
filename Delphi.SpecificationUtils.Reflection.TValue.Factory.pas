unit Delphi.SpecificationUtils.Reflection.TValue.Factory;

interface

uses
  Spring.DesignPatterns,
  Delphi.SpecificationUtils,
  System.Rtti,
  System.TypInfo;

type

  TReflectionRttiValueFactory = class(TInterfacedObject, IReflectionRttiValueSpecifications)
  public
    function IsOfTypeKind(const AValue: TTypeKinds): TSpecification<TValue>;
    function IsEmpty: TSpecification<TValue>;
    function IsObject: TSpecification<TValue>;
    function IsClass: TSpecification<TValue>;
    function IsOrdinal: TSpecification<TValue>;
    function IsArray: TSpecification<TValue>;
    function IsType(const AValue: PTypeInfo): TSpecification<TValue>;
    function IsInstanceOf(const AValue: TClass): TSpecification<TValue>;
  end;

implementation

uses
  Delphi.SpecificationUtils.Reflection.TValue;

{ TReflectionRttiValueFactory }

function TReflectionRttiValueFactory.IsArray: TSpecification<TValue>;
begin
  Result := TValueIsArray.Create;
end;

function TReflectionRttiValueFactory.IsClass: TSpecification<TValue>;
begin
  Result := TValueIsClass.Create;
end;

function TReflectionRttiValueFactory.IsEmpty: TSpecification<TValue>;
begin
  Result := TValueIsEmpty.Create;
end;

function TReflectionRttiValueFactory.IsInstanceOf(const AValue: TClass): TSpecification<TValue>;
begin
  Result := TValueIsInstanceOf.Create(AValue);
end;

function TReflectionRttiValueFactory.IsObject: TSpecification<TValue>;
begin
  Result := TValueIsObject.Create;
end;

function TReflectionRttiValueFactory.IsOfTypeKind(const AValue: TTypeKinds): TSpecification<TValue>;
begin
  Result := TValueIsOfTypeKind.Create(AValue);
end;

function TReflectionRttiValueFactory.IsOrdinal: TSpecification<TValue>;
begin
  Result := TValueIsOrdinal.Create;
end;

function TReflectionRttiValueFactory.IsType(const AValue: PTypeInfo): TSpecification<TValue>;
begin
  Result := TValueIsType.Create(AValue);
end;

end.
