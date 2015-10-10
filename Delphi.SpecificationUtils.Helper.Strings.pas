unit Delphi.SpecificationUtils.Helper.Strings;

interface

type
  TSpecificationStringHelper = record helper for String
  public
    function IsEmpty: boolean;
    function Length: Integer;
    function ByteLength: Integer;
    function Characters: TArray<Char>;

    function Equals(const AValue: string): boolean;
    function EqualsCaseSensitive(const AValue: string): boolean;
    function EqualsAny(const AValues: TArray<string>): boolean;
    function EqualsAnyCaseSensitive(const AValues: TArray<string>): boolean;

    function Contains(const AValue: string): boolean;
    function ContainsCaseSensitive(const AValue: string): boolean;
    function ContainsAny(const AValues: TArray<string>): boolean;
    function ContainsAnyCaseSensitive(const AValues: TArray<string>): boolean;

    function StartsWith(const AValue: string): boolean;
    function StartsWithCaseSensitive(const AValue: string): boolean;
    function StartsWithAny(const AValues: TArray<string>): boolean;
    function StartsWithAnyCaseSensitive(const AValues: TArray<string>): boolean;

    function EndsWith(const AValue: string): boolean;
    function EndsWithCaseSensitive(const AValue: string): boolean;
    function EndsWithAny(const AValues: TArray<string>): boolean;
    function EndsWithAnyCaseSensitive(const AValues: TArray<string>): boolean;
  end;

implementation

uses
  Delphi.SpecificationUtils.Strings.CaseSensitive,
  Delphi.SpecificationUtils.Strings.CaseInsensitive,
  Delphi.SpecificationUtils.Strings,
  System.SysUtils;

{ TSpecificationStringHelper }

function TSpecificationStringHelper.ByteLength: Integer;
begin
  Result := System.SysUtils.ByteLength(Self);
end;

function TSpecificationStringHelper.Characters: TArray<Char>;
var
  I: Integer;
begin
  SetLength(Result, Self.Length);
  for I := 1 to Self.Length do
    Result[i-1] := Self[i];
end;

function TSpecificationStringHelper.Contains(const AValue: string): boolean;
begin
  Result := TStringCIContains.Create(AValue).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.ContainsAny(const AValues: TArray<string>): boolean;
begin
  Result := TStringCIContainsAny.Create(AValues).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.ContainsAnyCaseSensitive(const AValues: TArray<string>): boolean;
begin
  Result := TStringCSContainsAny.Create(AValues).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.ContainsCaseSensitive(const AValue: string): boolean;
begin
  Result := TStringCSContains.Create(AValue).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.EndsWith(const AValue: string): boolean;
begin
  Result := TStringCIEndsWith.Create(Avalue).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.EndsWithAny(const AValues: TArray<string>): boolean;
begin
  Result := TStringCIEndsWithAny.Create(AValues).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.EndsWithAnyCaseSensitive(const AValues: TArray<string>): boolean;
begin
  Result := TStringCSEndsWithAny.Create(AValues).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.EndsWithCaseSensitive(const AValue: string): boolean;
begin
  Result := TStringCSEndsWith.Create(Avalue).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.Equals(const AValue: string): boolean;
begin
  Result := TStringCIEquals.Create(AValue).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.EqualsAny(const AValues: TArray<string>): boolean;
begin
  Result := TStringCIEqualsAny.Create(AValues).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.EqualsAnyCaseSensitive(const AValues: TArray<string>): boolean;
begin
  Result := TStringCSEqualsAny.Create(AValues).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.EqualsCaseSensitive(const AValue: string): boolean;
begin
  Result := TStringCSEquals.Create(AValue).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.IsEmpty: boolean;
begin
  Result := TStringIsEmpty.Create.IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.Length: Integer;
begin
  Result := System.Length(Self);
end;

function TSpecificationStringHelper.StartsWith(const AValue: string): boolean;
begin
  Result := TStringCIStartsWith.Create(Avalue).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.StartsWithAny(const AValues: TArray<string>): boolean;
begin
  Result := TStringCIStartsWithAny.Create(AValues).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.StartsWithAnyCaseSensitive(const AValues: TArray<string>): boolean;
begin
  Result := TStringCSStartsWithAny.Create(AValues).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.StartsWithCaseSensitive(const AValue: string): boolean;
begin
  Result := TStringCIStartsWith.Create(Avalue).IsSatisfiedBy(Self);
end;

end.
