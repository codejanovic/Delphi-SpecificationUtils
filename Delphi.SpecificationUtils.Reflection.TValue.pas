unit Delphi.SpecificationUtils.Reflection.TValue;

interface

uses
  Spring.DesignPatterns,
  System.Rtti,
  Spring,
  Delphi.SpecificationUtils;

type

  TValueIsOfTypeKind = class(TSpecificationBase<TValue>)
  protected
    fTypeKinds: TTypeKinds;
  public
    constructor Create(const AValue: TTypeKinds);
    function IsSatisfiedBy(const item: TValue): Boolean; override;
  end;

  TValueIsEmpty = class(TSpecificationBase<TValue>)
  public
    function IsSatisfiedBy(const item: TValue): Boolean; override;
  end;

  TValueIsObject = class(TSpecificationBase<TValue>)
  public
    function IsSatisfiedBy(const item: TValue): Boolean; override;
  end;

  TValueIsClass = class(TSpecificationBase<TValue>)
  public
    function IsSatisfiedBy(const item: TValue): Boolean; override;
  end;

  TValueIsOrdinal = class(TSpecificationBase<TValue>)
  public
    function IsSatisfiedBy(const item: TValue): Boolean; override;
  end;

  TValueIsArray = class(TSpecificationBase<TValue>)
  public
    function IsSatisfiedBy(const item: TValue): Boolean; override;
  end;

  TValueIsType<T> = class(TSpecificationBase<TValue>)
  public
    function IsSatisfiedBy(const item: TValue): Boolean; override;
  end;

  TValueIsType = class(TSpecificationBase<TValue>)
  protected
    fTypeInfo: PTypeInfo;
  public
    constructor Create(const AValue: PTypeInfo);
    function IsSatisfiedBy(const item: TValue): Boolean; override;
  end;

  TValueIsInstanceOf = class(TSpecificationBase<TValue>)
  protected
    fClass: TClass;
  public
    constructor Create(const AValue: TClass);
    function IsSatisfiedBy(const item: TValue): Boolean; override;
  end;

implementation

{ TValueIsOfTypeKind }

constructor TValueIsOfTypeKind.Create(const AValue: TTypeKinds);
begin
  fTypeKinds := AValue;
end;

function TValueIsOfTypeKind.IsSatisfiedBy(const item: TValue): Boolean;
begin
  Result := item.Kind in fTypeKinds;
end;

{ TValueIsObject }

function TValueIsObject.IsSatisfiedBy(const item: TValue): Boolean;
begin
  Result := item.IsObject;
end;

{ TValueIsInstanceOf }

constructor TValueIsInstanceOf.Create(const AValue: TClass);
begin
  fClass := AValue;
end;

function TValueIsInstanceOf.IsSatisfiedBy(const item: TValue): Boolean;
begin
  Result := item.IsInstanceOf(fClass);
end;

{ TValueIsClass }

function TValueIsClass.IsSatisfiedBy(const item: TValue): Boolean;
begin
  Result := item.IsClass;
end;

{ TValueIsOrdinal }

function TValueIsOrdinal.IsSatisfiedBy(const item: TValue): Boolean;
begin
  Result := item.IsOrdinal;
end;

{ TValueIsType }

constructor TValueIsType.Create(const AValue: PTypeInfo);
begin
  fTypeInfo := AValue;
end;

function TValueIsType.IsSatisfiedBy(const item: TValue): Boolean;
begin
  Result := item.IsType(fTypeInfo);
end;

{ TValueIsType<T> }

function TValueIsType<T>.IsSatisfiedBy(const item: TValue): Boolean;
begin
  Result := item.IsType<T>;
end;

{ TValueIsArray }

function TValueIsArray.IsSatisfiedBy(const item: TValue): Boolean;
begin
  Result := item.IsArray;
end;

{ TValueIsEmpty }

function TValueIsEmpty.IsSatisfiedBy(const item: TValue): Boolean;
begin
  Result := item.IsEmpty;
end;

end.
