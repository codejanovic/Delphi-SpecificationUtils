unit Delphi.SpecificationUtils.Strings.CaseInsensitive;

interface

uses
  Spring.DesignPatterns;

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
    fSubstrings: TArray<string>;
  public
    constructor Create(const ASubStrings: TArray<string>);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringCIEqualsAny = class(TSpecificationBase<String>)
  protected
    fValues: TArray<String>;
  public
    constructor Create(const AValues: TArray<String>);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringCIStartsWith = class(TSpecificationBase<String>)
  protected
    fSubstring: String;
  public
    constructor Create(const ASubString: String);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringCIStartsWithAny = class(TSpecificationBase<String>)
  protected
    fSubstrings: TArray<String>;
  public
    constructor Create(const ASubStrings: TArray<String>);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringCIEndsWith = class(TSpecificationBase<String>)
  protected
    fSubstring: String;
  public
    constructor Create(const ASubString: String);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringCIEndsWithAny = class(TSpecificationBase<String>)
  protected
    fSubstrings: TArray<String>;
  public
    constructor Create(const ASubStrings: TArray<String>);
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

constructor TStringCIContainsAny.Create(const ASubStrings: TArray<string>);
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

constructor TStringCIEqualsAny.Create(const AValues: TArray<String>);
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

{ TStringCIStartsWith }

constructor TStringCIStartsWith.Create(const ASubString: String);
begin
  fSubstring := ASubString;
end;

function TStringCIStartsWith.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := item.StartsWith(fSubstring, true);
end;

{ TStringCIStartsWithAny }

constructor TStringCIStartsWithAny.Create(const ASubStrings: TArray<String>);
begin
  fSubstrings := ASubStrings;
end;

function TStringCIStartsWithAny.IsSatisfiedBy(const item: String): Boolean;
var
  LSubstring: String;
begin
  Result := False;
  for LSubstring in fSubstrings do
    if TStringCIStartsWith.Create(LSubstring).IsSatisfiedBy(item) then
      Exit(True);
end;

{ TStringCIEndsWithAny }

constructor TStringCIEndsWithAny.Create(const ASubStrings: TArray<String>);
begin
  fSubstrings := ASubStrings;
end;

function TStringCIEndsWithAny.IsSatisfiedBy(const item: String): Boolean;
var
  LSubstring: String;
begin
  Result := False;
  for LSubstring in fSubstrings do
    if TStringCIEndsWith.Create(LSubstring).IsSatisfiedBy(item) then
      Exit(True);
end;

{ TStringCIEndsWith }

constructor TStringCIEndsWith.Create(const ASubString: String);
begin
  fSubstring := ASubString;
end;

function TStringCIEndsWith.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := item.EndsWith(fSubstring, true);
end;
end.
