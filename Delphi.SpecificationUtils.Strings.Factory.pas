unit Delphi.SpecificationUtils.Strings.Factory;

interface


uses
  Delphi.SpecificationUtils,
  Spring.DesignPatterns,
  System.Generics.Defaults,
  System.RegularExpressions;

type
  TStringSpecificationsFactory = class(TInterfacedObject, IStringSpecifications)
  public
    function HasLength(const ALength: Integer): TSpecification<String>;
    function HasLengthGreatherThan(const AMinLength: Integer): TSpecification<String>;
    function HasLengthLessThan(const AMaxLength: Integer): TSpecification<String>;
    function IsBoolean: TSpecification<String>;
    function MatchesRegex(const AExpression: String; const AOptions: TRegExOptions): TSpecification<String>;
    function IsInteger: TSpecification<String>;
    function IsFloat: TSpecification<String>;
    function IsGUID: TSpecification<String>;

    function ContainsAny(const ASubStrings: TArray<String>): TSpecification<String>;
    function EqualsAny(const AValues: TArray<String>): TSpecification<String>;
    function Contains(const ASubString: String): TSpecification<String>;
    function Equals(const AValue: String): TSpecification<String>; reintroduce;
    function StartsWith(const ASubString: String): TSpecification<String>;
    function StartsWithAny(const ASubStrings: TArray<String>): TSpecification<String>;
    function EndsWithAny(const ASubStrings: TArray<String>): TSpecification<String>;
    function EndsWith(const ASubString: String): TSpecification<String>;

    function ContainsIgnoreCase(const ASubString: String): TSpecification<String>;
    function EqualsIgnoreCase(const AValue: String): TSpecification<String>;
    function ContainsAnyIgnoreCase(const ASubStrings: TArray<string>): TSpecification<String>;
    function EqualsAnyIgnoreCase(const AValues: TArray<String>): TSpecification<String>;
    function StartsWithIgnoreCase(const ASubString: String): TSpecification<String>;
    function StartsWithAnyIgnoreCase(const ASubStrings: TArray<String>): TSpecification<String>;
    function EndsWithAnyIgnoreCase(const ASubStrings: TArray<String>): TSpecification<String>;
    function EndsWithIgnoreCase(const ASubString: String): TSpecification<String>;
  end;
implementation

uses
  Delphi.SpecificationUtils.Strings,
  Delphi.SpecificationUtils.Strings.CaseSensitive,
  Delphi.SpecificationUtils.Strings.IgnoreCase;

{ TStringSpecificationsFactory<T> }

function TStringSpecificationsFactory.Contains(const ASubString: String): TSpecification<String>;
begin
  Result := TStringContains.Create(ASubString);
end;

function TStringSpecificationsFactory.ContainsAny(const ASubStrings: TArray<String>): TSpecification<String>;
begin
  Result := TStringContainsAny.Create(ASubStrings);
end;

function TStringSpecificationsFactory.ContainsAnyIgnoreCase(const ASubStrings: TArray<string>): TSpecification<String>;
begin
  Result := TStringContainsAnyIgnoreCase.Create(ASubStrings);
end;

function TStringSpecificationsFactory.ContainsIgnoreCase(const ASubString: String): TSpecification<String>;
begin
  Result := TStringContainsIgnoreCase.Create(ASubString);
end;

function TStringSpecificationsFactory.EndsWith(const ASubString: String): TSpecification<String>;
begin
  Result := TStringEndsWith.Create(ASubString);
end;

function TStringSpecificationsFactory.EndsWithAny(const ASubStrings: TArray<String>): TSpecification<String>;
begin
  Result := TStringEndsWithAny.Create(ASubStrings);
end;

function TStringSpecificationsFactory.EndsWithAnyIgnoreCase(const ASubStrings: TArray<String>): TSpecification<String>;
begin
  Result := TStringEndsWithAnyIgnoreCase.Create(ASubStrings);
end;

function TStringSpecificationsFactory.EndsWithIgnoreCase(const ASubString: String): TSpecification<String>;
begin
  Result := TStringEndsWithIgnoreCase.Create(ASubString);
end;

function TStringSpecificationsFactory.Equals(const AValue: String): TSpecification<String>;
begin
  Result := TStringEquals.Create(AValue);
end;

function TStringSpecificationsFactory.EqualsAny(const AValues: TArray<String>): TSpecification<String>;
begin
  Result := TStringEqualsAny.Create(AValues);
end;

function TStringSpecificationsFactory.EqualsAnyIgnoreCase(const AValues: TArray<String>): TSpecification<String>;
begin
  Result := TStringEqualsAnyIgnoreCase.Create(AValues);
end;

function TStringSpecificationsFactory.EqualsIgnoreCase(const AValue: String): TSpecification<String>;
begin
  Result := TStringEqualsIgnoreCase.Create(AValue);
end;

function TStringSpecificationsFactory.HasLength(const ALength: Integer): TSpecification<String>;
begin
  Result := TStringHasLength.Create(ALength);
end;

function TStringSpecificationsFactory.HasLengthGreatherThan(const AMinLength: Integer): TSpecification<String>;
begin
  Result := TStringHasLengthGreatherThan.Create(AMinLength);
end;

function TStringSpecificationsFactory.HasLengthLessThan(const AMaxLength: Integer): TSpecification<String>;
begin
  Result := TStringHasLengthLessThan.Create(AMaxLength);
end;

function TStringSpecificationsFactory.IsBoolean: TSpecification<String>;
begin
  Result := TStringIsBoolean.Create();
end;

function TStringSpecificationsFactory.IsFloat: TSpecification<String>;
begin
  Result := TStringIsFloat.Create();
end;

function TStringSpecificationsFactory.IsGUID: TSpecification<String>;
begin
  Result := TStringIsGUID.Create();
end;

function TStringSpecificationsFactory.IsInteger: TSpecification<String>;
begin
  Result := TStringIsInteger.Create();
end;

function TStringSpecificationsFactory.MatchesRegex(const AExpression: String; const AOptions: TRegExOptions): TSpecification<String>;
begin
  Result := TStringMatchesRegex.Create(AExpression, AOptions);
end;

function TStringSpecificationsFactory.StartsWith(const ASubString: String): TSpecification<String>;
begin
  Result := TStringStartsWith.Create(ASubString);
end;

function TStringSpecificationsFactory.StartsWithAny(const ASubStrings: TArray<String>): TSpecification<String>;
begin
  Result := TStringStartsWithAny.Create(ASubStrings);
end;

function TStringSpecificationsFactory.StartsWithAnyIgnoreCase(const ASubStrings: TArray<String>): TSpecification<String>;
begin
  Result := TStringStartsWithAnyIgnoreCase.Create(ASubStrings);
end;

function TStringSpecificationsFactory.StartsWithIgnoreCase(const ASubString: String): TSpecification<String>;
begin
  Result := TStringStartsWithIgnoreCase.Create(ASubString);
end;

end.
