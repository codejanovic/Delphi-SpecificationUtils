unit Delphi.SpecificationUtils.Helper.Strings;

interface

uses
  System.SysUtils, System.RegularExpressions;

type
  TSpecificationStringHelper = record helper for String
  public
    function IncludeTrailingPathDelimiter: String;
    function Trim: String;
    function TrimLeft: String;
    function TrimRight: String;
    function IsEmpty: boolean;
    function Length: Integer;
    function ByteLength: Integer;
    function Characters: TArray<Char>;

    function IsBoolean: boolean;
    function IsInteger: boolean;
    function IsFloat: boolean;
    function IsGUID: boolean;

    function TryToBool(out OValue: boolean): boolean;
    function TryToInteger(out OValue: Integer): boolean;
    function TryToFloat(out OValue: Extended): boolean;
    function TryToGUID(out OValue: TGUID): Boolean;
    function ToArray: TArray<String>; overload;
    function ToArray(const ASeparator: Char): TArray<String>; overload;
    function ToDate: TDateTime; overload;
    function ToDate(const AFormatSettings: TFormatSettings): TDateTime; overload;
    function ToDateTime: TDateTime; overload;
    function ToDateTime(const AFormatSettings: TFormatSettings): TDateTime; overload;

    function Concat(const AValue: String): string;
    function ConcatLeft(const AValue: String): string;
    function ConcatRight(const AValue: String): string;

    function Matches(const AExpression: String): boolean; overload;
    function Matches(const AExpression: String; const ARegexOptions: TRegExOptions): boolean; overload;
    function MatchesIgnoreCase(const AExpression: String): boolean;

    function RemoveIgnoreCase(const AValue: String): String; overload;
    function RemoveIgnoreCase(const AValue: TArray<String>): String; overload;
    function Remove(const AValue: String): String; overload;
    function Remove(const AValue: TArray<String>): String; overload;
    function RemoveAllIgnoreCase(const AValue: String): String; overload;
    function RemoveAllIgnoreCase(const AValue: TArray<String>): String; overload;
    function RemoveAll(const AValue: String): String; overload;
    function RemoveAll(const AValue: TArray<String>): String; overload;
    function RemoveByRegex(const AExpression: String): String; overload;
    function RemoveByRegex(const AExpression: String; const ARegexOptions: TRegExOptions): String; overload;
    function RemoveIgnoreCaseByRegex(const AExpression: String): String;

    function ReplaceIgnoreCase(const AOldValue: String; const ANewValue: String): String;
    function Replace(const AOldValue: String; const ANewValue: String): String;
    function ReplaceAllIgnoreCase(const AOldValue: String; const ANewValue: String): String;
    function ReplaceAll(const AOldValue: String; const ANewValue: String): String;
    function ReplaceByRegex(const AExpression: String; const ANewValue: String): String; overload;
    function ReplaceByRegex(const AExpression: String; const ANewValue: String; const ARegexOptions: TRegExOptions): String; overload;
    function ReplaceIgnoreCaseByRegex(const AExpression: String; const ANewValue: String): String;

    function EqualsIgnoreCase(const AValue: string): boolean;
    function Equals(const AValue: string): boolean;
    function EqualsAnyIgnoreCase(const AValues: TArray<string>): boolean;
    function EqualsAny(const AValues: TArray<string>): boolean;

    function ContainsIgnoreCase(const AValue: string): boolean;
    function Contains(const AValue: string): boolean;
    function ContainsAnyIgnoreCase(const AValues: TArray<string>): boolean;
    function ContainsAny(const AValues: TArray<string>): boolean;

    function StartsWithIgnoreCase(const AValue: string): boolean;
    function StartsWith(const AValue: string): boolean;
    function StartsWithAnyIgnoreCase(const AValues: TArray<string>): boolean;
    function StartsWithAny(const AValues: TArray<string>): boolean;

    function EndsWithIgnoreCase(const AValue: string): boolean;
    function EndsWith(const AValue: string): boolean;
    function EndsWithAnyIgnoreCase(const AValues: TArray<string>): boolean;
    function EndsWithAny(const AValues: TArray<string>): boolean;

    function Split(const ASeparator: Char): TArray<String>; overload;
    function SplitIgnoreCase(const ASeparator: Char): TArray<String>; overload;
    function Split(const ASeparatorRegex: String): TArray<String>; overload;
    function Split(const ASeparatorRegex: String; const ARegexOptions: TRegExOptions): TArray<String>; overload;
    function SplitIgnoreCase(const ASeparatorRegex: String): TArray<String>; overload;
  end;

implementation

uses
  Delphi.SpecificationUtils.Strings.CaseSensitive,
  Delphi.SpecificationUtils.Strings.IgnoreCase,
  Delphi.SpecificationUtils.Strings,
  System.Classes;

{ TSpecificationStringHelper }

function TSpecificationStringHelper.Concat(const AValue: String): string;
begin
  Result := Self;
  Result := Result + AValue;
end;

function TSpecificationStringHelper.ConcatLeft(const AValue: String): string;
begin
  Result := AValue + Self;
end;

function TSpecificationStringHelper.ConcatRight(const AValue: String): string;
begin
  Result := Self.Concat(AValue);
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

function TSpecificationStringHelper.ContainsIgnoreCase(const AValue: string): boolean;
begin
  Result := TStringContainsIgnoreCase.Create(AValue).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.ContainsAnyIgnoreCase(const AValues: TArray<string>): boolean;
begin
  Result := TStringContainsAnyIgnoreCase.Create(AValues).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.ContainsAny(const AValues: TArray<string>): boolean;
begin
  Result := TStringContainsAny.Create(AValues).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.Contains(const AValue: string): boolean;
begin
  Result := TStringContains.Create(AValue).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.EndsWithIgnoreCase(const AValue: string): boolean;
begin
  Result := TStringEndsWithIgnoreCase.Create(Avalue).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.EndsWithAnyIgnoreCase(const AValues: TArray<string>): boolean;
begin
  Result := TStringEndsWithAnyIgnoreCase.Create(AValues).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.EndsWithAny(const AValues: TArray<string>): boolean;
begin
  Result := TStringEndsWithAny.Create(AValues).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.EndsWith(const AValue: string): boolean;
begin
  Result := TStringEndsWith.Create(Avalue).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.EqualsIgnoreCase(const AValue: string): boolean;
begin
  Result := TStringEqualsIgnoreCase.Create(AValue).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.EqualsAnyIgnoreCase(const AValues: TArray<string>): boolean;
begin
  Result := TStringEqualsAnyIgnoreCase.Create(AValues).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.EqualsAny(const AValues: TArray<string>): boolean;
begin
  Result := TStringEqualsAny.Create(AValues).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.Equals(const AValue: string): boolean;
begin
  Result := TStringEquals.Create(AValue).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.IncludeTrailingPathDelimiter: String;
begin
  REsult := System.SysUtils.IncludeTrailingPathDelimiter(Self);
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

function TSpecificationStringHelper.IsGUID: boolean;
begin
  Result := TStringIsGUID.Create.IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.IsInteger: boolean;
begin
  Result := TStringIsInteger.Create.IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.Length: Integer;
begin
  Result := System.Length(Self);
end;

function TSpecificationStringHelper.Matches(const AExpression: String): boolean;
begin
  Result := Self.Matches(AExpression, [roNone]);
end;

function TSpecificationStringHelper.Matches(const AExpression: String; const ARegexOptions: TRegExOptions): boolean;
begin
  Result := TStringMatchesRegex.Create(AExpression, ARegexOptions).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.MatchesIgnoreCase(const AExpression: String): boolean;
begin
  Result := Self.Matches(AExpression, [roIgnoreCase]);
end;

function TSpecificationStringHelper.RemoveIgnoreCase(const AValue: String): String;
begin
  Result := Self.ReplaceIgnoreCase(AValue, '');
end;

function TSpecificationStringHelper.RemoveAllIgnoreCase(const AValue: String): String;
begin
  Result := Self.ReplaceAllIgnoreCase(AValue, '');
end;

function TSpecificationStringHelper.RemoveAll(const AValue: String): String;
begin
  Result := Self.ReplaceAll(AValue, '');
end;

function TSpecificationStringHelper.RemoveByRegex(const AExpression: String): String;
begin
  Result := Self.ReplaceByRegex(AExpression, '');
end;

function TSpecificationStringHelper.Remove(const AValue: TArray<String>): String;
var
  LSingleValue: String;
begin
  Result := Self;

  for LSingleValue in AValue do
    Result := Result.Remove(LSingleValue);
end;

function TSpecificationStringHelper.Remove(const AValue: String): String;
begin
  Result := Self.Replace(AValue, '');
end;

function TSpecificationStringHelper.ReplaceIgnoreCase(const AOldValue, ANewValue: String): String;
begin
  Result := System.SysUtils.StringReplace(Self, AOldValue, ANewValue, [rfIgnoreCase]);
end;

function TSpecificationStringHelper.ReplaceIgnoreCaseByRegex(const AExpression, ANewValue: String): String;
begin
  Result := Self.ReplaceByRegex(AExpression, ANewValue, [roIgnoreCase]);
end;

function TSpecificationStringHelper.ReplaceAllIgnoreCase(const AOldValue, ANewValue: String): String;
begin
  Result := System.SysUtils.StringReplace(Self, AOldValue, ANewValue, [rfReplaceAll, rfIgnoreCase]);
end;

function TSpecificationStringHelper.ReplaceByRegex(const AExpression, ANewValue: String; const ARegexOptions: TRegExOptions): String;
var
  LRegex: TRegEx;
begin
  LRegex.Create(AExpression, ARegexOptions);
  Result := LRegex.Replace(Self, ANewValue);
end;

function TSpecificationStringHelper.ReplaceAll(const AOldValue, ANewValue: String): String;
begin
  Result := System.SysUtils.StringReplace(Self, AOldValue, ANewValue, [rfReplaceAll]);
end;

function TSpecificationStringHelper.ReplaceByRegex(const AExpression, ANewValue: String): String;
begin
  Result := Self.ReplaceByRegex(AExpression, ANewValue, [roNone]);
end;

function TSpecificationStringHelper.Replace(const AOldValue, ANewValue: String): String;
begin
  Result := System.SysUtils.StringReplace(Self, AOldValue, ANewValue, []);
end;

function TSpecificationStringHelper.Split(const ASeparator: Char): TArray<String>;
var
  LRegex: String;
begin
  LRegex := TRegEx.Escape(ASeparator);
  Result := Self.Split(LRegex);
end;

function TSpecificationStringHelper.Split(const ASeparatorRegex: String): TArray<String>;
begin
  Result := Self.Split(ASeparatorRegex, [roNone]);
end;

function TSpecificationStringHelper.SplitIgnoreCase(const ASeparator: Char): TArray<String>;
var
  LRegex: String;
begin
  LRegex := TRegEx.Escape(ASeparator);
  Result := Self.SplitIgnoreCase(LRegex);
end;

function TSpecificationStringHelper.SplitIgnoreCase(const ASeparatorRegex: String): TArray<String>;
begin
  Result := Self.Split(ASeparatorRegex, [roIgnoreCase]);
end;

function TSpecificationStringHelper.Split(const ASeparatorRegex: String; const ARegexOptions: TRegExOptions): TArray<String>;
var
  LRegex: TRegEx;
begin
  LRegex.Create(ASeparatorRegex, ARegexOptions);
  Result := LRegex.Split(Self);
end;

function TSpecificationStringHelper.StartsWith(const AValue: string): boolean;
begin
  Result := TStringStartsWithIgnoreCase.Create(Avalue).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.StartsWithAnyIgnoreCase(const AValues: TArray<string>): boolean;
begin
  Result := TStringStartsWithAnyIgnoreCase.Create(AValues).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.StartsWithAny(const AValues: TArray<string>): boolean;
begin
  Result := TStringStartsWithAny.Create(AValues).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.StartsWithIgnoreCase(const AValue: string): boolean;
begin
  Result := TStringStartsWithIgnoreCase.Create(Avalue).IsSatisfiedBy(Self);
end;

function TSpecificationStringHelper.ToArray: TArray<String>;
begin
  Result := Self.ToArray(',');
end;

function TSpecificationStringHelper.ToArray(const ASeparator: Char): TArray<String>;
var
  LStringList: TStringList;
  I: Integer;
begin
  LStringList := TStringList.Create;
  try
    LStringList.Delimiter := ASeparator;
    LStringList.CommaText := Self;

    SetLength(Result, LStringList.Count);
    for I := 0 to LStringList.Count -1 do
      Result[i] := LStringList.Strings[i];
  finally
    LStringList.Free;
  end;
end;

function TSpecificationStringHelper.ToDate: TDateTime;
begin
  Result := System.SysUtils.StrToDate(Self);
end;

function TSpecificationStringHelper.ToDateTime: TDateTime;
begin
  Result := System.SysUtils.StrToDateTime(Self);
end;

function TSpecificationStringHelper.Trim: String;
begin
  Result := System.SysUtils.Trim(Self);
end;

function TSpecificationStringHelper.TrimLeft: String;
begin
  Result := System.SysUtils.TrimLeft(Self);
end;

function TSpecificationStringHelper.TrimRight: String;
begin
  Result := System.SysUtils.TrimRight(Self);
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

function TSpecificationStringHelper.TryToGUID(out OValue: TGUID): Boolean;
var
  LGuidString: String;
begin
  if not Self.IsGUID then
    Exit(False);

  Result := true;
  LGuidString := Self.Trim;

  if not LGuidString.StartsWith('{') then
    LGuidString := LGuidString.ConcatLeft('{');
  if not LGuidString.EndsWith('}') then
    LGuidString := LGuidString.ConcatRight('}');

  OValue := StringToGUID(LGuidString);
end;

function TSpecificationStringHelper.TryToInteger(out OValue: Integer): boolean;
begin
  if not Self.IsInteger then
    Exit(false);

  Result := TryStrToInt(Self, OValue);
end;

function TSpecificationStringHelper.RemoveIgnoreCase(const AValue: TArray<String>): String;
var
  LSingleValue: String;
begin
  Result := Self;

  for LSingleValue in AValue do
    Result := Result.RemoveIgnoreCase(LSingleValue);
end;

function TSpecificationStringHelper.RemoveIgnoreCaseByRegex(const AExpression: String): String;
begin
  Result := Self.ReplaceIgnoreCaseByRegex(AExpression, '');
end;

function TSpecificationStringHelper.RemoveAllIgnoreCase(const AValue: TArray<String>): String;
var
  LSingleValue: String;
begin
  Result := Self;

  for LSingleValue in AValue do
    Result := Result.RemoveAllIgnoreCase(LSingleValue);
end;

function TSpecificationStringHelper.RemoveByRegex(const AExpression: String; const ARegexOptions: TRegExOptions): String;
begin
  Result := Self.ReplaceByRegex(AExpression, '', ARegexOptions);
end;

function TSpecificationStringHelper.RemoveAll(const AValue: TArray<String>): String;
var
  LSingleValue: String;
begin
  Result := Self;

  for LSingleValue in AValue do
    Result := Result.RemoveAll(LSingleValue);
end;

function TSpecificationStringHelper.ToDate(const AFormatSettings: TFormatSettings): TDateTime;
begin
  Result := System.SysUtils.StrToDate(Self, AFormatSettings);
end;

function TSpecificationStringHelper.ToDateTime(const AFormatSettings: TFormatSettings): TDateTime;
begin
  Result := System.SysUtils.StrToDateTime(Self, AFormatSettings);
end;

end.
