unit Delphi.SpecificationUtils.Strings.CaseInsensitive;

interface

uses
  Spring.DesignPatterns,
  Delphi.SpecificationUtils;

type
  TStringCIContains = class(TSpecificationBase<String>)
  protected
    fSubstring: String;
  public
    constructor Create(const ASubString: String);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringCIEquals = class(TSpecificationBase<String>)
  protected
    fValue: String;
  public
    constructor Create(const AValue: String);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringCIContainsAny = class(TSpecificationBase<String>)
  protected
    fSubstrings: TStringArray;
  public
    constructor Create(const ASubStrings: TStringArray);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringCIEqualsAny = class(TSpecificationBase<String>)
  protected
    fValues: TStringArray;
  public
    constructor Create(const AValues: TStringArray);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils;

{ TStringContainsCaseInsensitive }

constructor TStringCIContains.Create(const ASubString: String);
begin
  fSubstring := ASubString;
end;

function TStringCIContains.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := ContainsText(item, fSubstring);
end;

{ TStringEqualsCaseInsensitive }

constructor TStringCIEquals.Create(const AValue: String);
begin
  fValue := AValue;
end;

function TStringCIEquals.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := SameText(item, fValue);
end;

{ TStringContainsAnyCaseInsensitive }

constructor TStringCIContainsAny.Create(const ASubStrings: TStringArray);
begin
  fSubstrings := ASubStrings;
end;

function TStringCIContainsAny.IsSatisfiedBy(const item: String): Boolean;
var
  LSubstring: String;
begin
  Result := False;
  for LSubstring in fSubstrings do
    if TStringCIContains.Create(LSubstring).IsSatisfiedBy(item) then
      Exit(True);
end;

{ TStringEqualsAnyCaseInsensitive }

constructor TStringCIEqualsAny.Create(const AValues: TStringArray);
begin
  fValues := AValues;
end;

function TStringCIEqualsAny.IsSatisfiedBy(const item: String): Boolean;
var
  LValue: String;
begin
  Result := False;
  for LValue in fValues do
    if TStringCIEquals.Create(LValue).IsSatisfiedBy(item) then
      Exit(True);
end;

end.
