unit Delphi.SpecificationUtils.Helper.Strings;

interface

type
  TSpecificationStringHelper = record helper for String
  public
    function IsEmpty: boolean;
    function Length: Integer;
    function ByteLength: Integer;
    function Characters: TArray<Char>;

    function IsBoolean: boolean;
    function IsInteger: boolean;
    function IsFloat: boolean;

    function TryToBool(out OValue: boolean): boolean;
    function TryToInteger(out OValue: Integer): boolean;
    function TryToFloat(out OValue: Extended): boolean;

    function Concat(const AValue: String): string;

    function Remove(const AValue: String): String;
    function RemoveCaseSensitive(const AValue: String): String;
    function RemoveAll(const AValue: String): String;
    function RemoveAllCaseSensitive(const AValue: String): String;
    function RemoveByRegex(const AExpression: String): String;

    function Replace(const AOldValue: String; const ANewValue: String): String;
    function ReplaceCaseSensitive(const AOldValue: String; const ANewValue: String): String;
    function ReplaceAll(const AOldValue: String; const ANewValue: String): String;
    function ReplaceAllCaseSensitive(const AOldValue: String; const ANewValue: String): String;
    function ReplaceByRegex(const AExpression: String; const ANewValue: String): String;

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
  System.SysUtils,
  System.RegularExpressions;

{ TSpecificationStringHelper }

function TSpecificationStringHelper.Concat(const AValue: String): string;
begin
  Result := Self;
  Result := Result + AValue;
end;

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

function TSpecificationStringHelper.IsBoolean: boolean;
begin
  Result := TStringIsBoolean.Create.IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.IsEmpty: boolean;
begin
  Result := TStringIsEmpty.Create.IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.IsFloat: boolean;
begin
  Result := TStringIsFloat.Create.IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.IsInteger: boolean;
begin
  Result := TStringIsInteger.Create.IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.Length: Integer;
begin
  Result := System.Length(Self);
end;

function TSpecificationStringHelper.Remove(const AValue: String): String;
begin
  Result := Self.Replace(AValue, '');
end;

function TSpecificationStringHelper.RemoveAll(const AValue: String): String;
begin
  Result := Self.ReplaceAll(AValue, '');
end;

function TSpecificationStringHelper.RemoveAllCaseSensitive(const AValue: String): String;
begin
  Result := Self.ReplaceAllCaseSensitive(AValue, '');
end;

function TSpecificationStringHelper.RemoveByRegex(const AExpression: String): String;
begin
  Result := Self.ReplaceByRegex(AExpression, '');
end;

function TSpecificationStringHelper.RemoveCaseSensitive(const AValue: String): String;
begin
  Result := Self.ReplaceCaseSensitive(AValue, '');
end;

function TSpecificationStringHelper.Replace(const AOldValue, ANewValue: String): String;
begin
  Result := System.SysUtils.StringReplace(Self, AOldValue, ANewValue, [rfIgnoreCase]);
end;

function TSpecificationStringHelper.ReplaceAll(const AOldValue, ANewValue: String): String;
begin
  Result := System.SysUtils.StringReplace(Self, AOldValue, ANewValue, [rfReplaceAll, rfIgnoreCase]);
end;

function TSpecificationStringHelper.ReplaceAllCaseSensitive(const AOldValue, ANewValue: String): String;
begin
  Result := System.SysUtils.StringReplace(Self, AOldValue, ANewValue, [rfReplaceAll]);
end;

function TSpecificationStringHelper.ReplaceByRegex(const AExpression, ANewValue: String): String;
var
  LRegex: TRegEx;
begin
  LRegex.Create(AExpression, [roMultiLine]);
  Result := LRegex.Replace(Self, ANewValue);
end;

function TSpecificationStringHelper.ReplaceCaseSensitive(const AOldValue, ANewValue: String): String;
begin
  Result := System.SysUtils.StringReplace(Self, AOldValue, ANewValue, []);
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

function TSpecificationStringHelper.TryToBool(out OValue: boolean): boolean;
begin
  if not Self.IsBoolean then
    Exit(false);

  Result := TryStrToBool(Self, OValue);
end;

function TSpecificationStringHelper.TryToFloat(out OValue: Extended): boolean;
begin
  if not Self.IsFloat then
    Exit(false);

  Result := TryStrToFloat(Self, OValue);
end;

function TSpecificationStringHelper.TryToInteger(out OValue: Integer): boolean;
begin
  if not Self.IsInteger then
    Exit(false);

  Result := TryStrToInt(Self, OValue);
end;

end.
