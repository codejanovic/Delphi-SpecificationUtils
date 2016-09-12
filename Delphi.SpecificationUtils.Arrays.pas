unit Delphi.SpecificationUtils.Arrays;

interface

uses
  Spring.DesignPatterns,
  System.Generics.Defaults;

type
  TArrayHasLength<T> = class(TSpecificationBase<TArray<T>>)
  protected
    fLength: Integer;
  public
    constructor Create(const ALength: Integer);
    function IsSatisfiedBy(const item: TArray<T>): Boolean; override;
  end;

  TArrayIsEmpty<T> = class(TSpecificationBase<TArray<T>>)
  protected
    fHasLengthOf0: ISpecification<TArray<T>>;
  public
    constructor Create;
    function IsSatisfiedBy(const item: TArray<T>): Boolean; override;
  end;

  TArrayEqualsInLength<T> = class(TSpecificationBase<TArray<T>>)
  protected
    fArray: TArray<T>;
  public
    constructor Create(const AArray: TArray<T>);
    function IsSatisfiedBy(const item: TArray<T>): Boolean; override;
  end;

  TArrayEqualsInSequence<T> = class(TSpecificationBase<TArray<T>>)
  protected
    fEqualityComparer: IEqualityComparer<T>;
    fArray: TArray<T>;
    fIsEqualInLength: ISpecification<TArray<T>>;
  public
    constructor Create(const AArray: TArray<T>; const AValue: IEqualityComparer<T>);
    function IsSatisfiedBy(const item: TArray<T>): Boolean; override;
  end;

  TArrayEquals<T> = class(TSpecificationBase<TArray<T>>)
  protected
    fEqualityComparer: IEqualityComparer<T>;
    fArray: TArray<T>;
    fIsEqualInLength: ISpecification<TArray<T>>;
  public
    constructor Create(const AArray: TArray<T>; const AValue: IEqualityComparer<T>);
    function IsSatisfiedBy(const item: TArray<T>): Boolean; override;
  end;

  TArrayContains<T> = class(TSpecificationBase<TArray<T>>)
  protected
    fItem: T;
    fEqualityComparer: IEqualityComparer<T>;
  public
    constructor Create(const AItem: T; const AValue: IEqualityComparer<T>);
    function IsSatisfiedBy(const item: TArray<T>): Boolean; override;
  end;

  TArrayContainsAny<T> = class(TSpecificationBase<TArray<T>>)
  protected
    fItems: TArray<T>;
    fEqualityComparer: IEqualityComparer<T>;
  public
    constructor Create(const AItems: TArray<T>; const AValue: IEqualityComparer<T>);
    function IsSatisfiedBy(const item: TArray<T>): Boolean; override;
  end;

implementation

uses
  Spring;

{ TArrayHasLength<T> }

constructor TArrayHasLength<T>.Create(const ALength: Integer);
begin
  fLength := ALength;
end;

function TArrayHasLength<T>.IsSatisfiedBy(const item: TArray<T>): Boolean;
begin
  Result := Length(item) = fLength;
end;

{ TArrayIsEmpty<T> }

constructor TArrayIsEmpty<T>.Create;
begin
  fHasLengthOf0 := TArrayHasLength<T>.Create(0);
end;

function TArrayIsEmpty<T>.IsSatisfiedBy(const item: TArray<T>): Boolean;
begin
  Result := fHasLengthOf0.IsSatisfiedBy(item);
end;

{ TArrayIsEqual<T> }

constructor TArrayEqualsInSequence<T>.Create(const AArray: TArray<T>; const AValue: IEqualityComparer<T>);
begin
  Guard.CheckNotNull(AValue, 'missing EqualityComparer');
  fEqualityComparer := AValue;
  fArray := AArray;
  fIsEqualInLength := TArrayEqualsInLength<T>.Create(AArray);
end;

function TArrayEqualsInSequence<T>.IsSatisfiedBy(const item: TArray<T>): Boolean;
var
  I: Integer;
  LLeft,
  LRight: T;
begin
  if not fIsEqualInLength.IsSatisfiedBy(item) then
    Exit(false);

  Result := true;

  for I := 0 to High(fArray) do
  begin
    LLeft := fArray[i];
    LRight := item[i];

    if not fEqualityComparer.Equals(LLeft, LRight) then
      Exit(False);
  end;
end;

{ TArrayIsEqual<T> }

constructor TArrayEquals<T>.Create(const AArray: TArray<T>; const AValue: IEqualityComparer<T>);
begin
  Guard.CheckNotNull(AValue, 'missing EqualityComparer');
  fEqualityComparer := AValue;
  fArray := AArray;
  fIsEqualInLength := TArrayEqualsInLength<T>.Create(AArray);
end;

function TArrayEquals<T>.IsSatisfiedBy(const item: TArray<T>): Boolean;
var
  LItem: T;
begin
  if not fIsEqualInLength.IsSatisfiedBy(item) then
    Exit(False);

  Result := true;
  for LItem in fArray do
  begin
    if not TArrayContains<T>.Create(LItem, fEqualityComparer).IsSatisfiedBy(item) then
      Exit(false);
  end;
end;

{ TArrayIsEqualInLength<T> }

constructor TArrayEqualsInLength<T>.Create(const AArray: TArray<T>);
begin
  fArray := AArray;
end;

function TArrayEqualsInLength<T>.IsSatisfiedBy(const item: TArray<T>): Boolean;
begin
  Result := Length(fArray) = Length(item);
end;

{ TArrayContains<T> }

constructor TArrayContains<T>.Create(const AItem: T; const AValue: IEqualityComparer<T>);
begin
  Guard.CheckNotNull(AValue, 'missing EqualityComparer');
  fItem := AItem;
  fEqualityComparer := AValue;
end;

function TArrayContains<T>.IsSatisfiedBy(const item: TArray<T>): Boolean;
var
  LArrayItem: T;
begin
  Result := false;

  for LArrayItem in item do
    if fEqualityComparer.Equals(LArrayItem, fItem) then
      Exit(true);
end;

{ TArrayContainsAny<T> }

constructor TArrayContainsAny<T>.Create(const AItems: TArray<T>; const AValue: IEqualityComparer<T>);
begin
  Guard.CheckNotNull(AValue, 'missing EqualityComparer');
  fItems := AItems;
  fEqualityComparer := AValue;
end;

function TArrayContainsAny<T>.IsSatisfiedBy(const item: TArray<T>): Boolean;
var
  LItem: T;
begin
  Result := false;
  for LItem in fItems do
    if TArrayContains<T>.Create(LItem, fEqualityComparer).IsSatisfiedBy(item) then
      Exit(true);
end;

end.
