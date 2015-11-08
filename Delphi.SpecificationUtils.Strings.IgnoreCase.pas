unit Delphi.SpecificationUtils.Strings.IgnoreCase;

interface

uses
  Spring.DesignPatterns;

type
  TStringContainsIgnoreCase = class(TSpecificationBase<String>)
  protected
    fSubstring: String;
  public
    constructor Create(const ASubString: String);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringEqualsIgnoreCase = class(TSpecificationBase<String>)
  protected
    fValue: String;
  public
    constructor Create(const AValue: String);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringContainsAnyIgnoreCase = class(TSpecificationBase<String>)
  protected
    fSubstrings: TArray<string>;
  public
    constructor Create(const ASubStrings: TArray<string>);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringEqualsAnyIgnoreCase = class(TSpecificationBase<String>)
  protected
    fValues: TArray<String>;
  public
    constructor Create(const AValues: TArray<String>);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringStartsWithIgnoreCase = class(TSpecificationBase<String>)
  protected
    fSubstring: String;
  public
    constructor Create(const ASubString: String);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringStartsWithAnyIgnoreCase = class(TSpecificationBase<String>)
  protected
    fSubstrings: TArray<String>;
  public
    constructor Create(const ASubStrings: TArray<String>);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringEndsWithIgnoreCase = class(TSpecificationBase<String>)
  protected
    fSubstring: String;
  public
    constructor Create(const ASubString: String);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringEndsWithAnyIgnoreCase = class(TSpecificationBase<String>)
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

constructor TStringContainsIgnoreCase.Create(const ASubString: String);
begin
  fSubstring := ASubString;
end;

function TStringContainsIgnoreCase.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := ContainsText(item, fSubstring);
end;

{ TStringEqualsCaseInsensitive }

constructor TStringEqualsIgnoreCase.Create(const AValue: String);
begin
  fValue := AValue.Trim;
end;

function TStringEqualsIgnoreCase.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := SameText(item.Trim, fValue);
end;

{ TStringContainsAnyCaseInsensitive }

constructor TStringContainsAnyIgnoreCase.Create(const ASubStrings: TArray<string>);
begin
  fSubstrings := ASubStrings;
end;

function TStringContainsAnyIgnoreCase.IsSatisfiedBy(const item: String): Boolean;
var
  LSubstring: String;
begin
  Result := False;
  for LSubstring in fSubstrings do
    if TStringContainsIgnoreCase.Create(LSubstring).IsSatisfiedBy(item) then
      Exit(True);
end;

{ TStringEqualsAnyCaseInsensitive }

constructor TStringEqualsAnyIgnoreCase.Create(const AValues: TArray<String>);
begin
  fValues := AValues;
end;

function TStringEqualsAnyIgnoreCase.IsSatisfiedBy(const item: String): Boolean;
var
  LValue: String;
begin
  Result := False;
  for LValue in fValues do
    if TStringEqualsIgnoreCase.Create(LValue).IsSatisfiedBy(item) then
      Exit(True);
end;

{ TStringCIStartsWith }

constructor TStringStartsWithIgnoreCase.Create(const ASubString: String);
begin
  fSubstring := ASubString;
end;

function TStringStartsWithIgnoreCase.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := item.StartsWith(fSubstring, true);
end;

{ TStringCIStartsWithAny }

constructor TStringStartsWithAnyIgnoreCase.Create(const ASubStrings: TArray<String>);
begin
  fSubstrings := ASubStrings;
end;

function TStringStartsWithAnyIgnoreCase.IsSatisfiedBy(const item: String): Boolean;
var
  LSubstring: String;
begin
  Result := False;
  for LSubstring in fSubstrings do
    if TStringStartsWithIgnoreCase.Create(LSubstring).IsSatisfiedBy(item) then
      Exit(True);
end;

{ TStringCIEndsWithAny }

constructor TStringEndsWithAnyIgnoreCase.Create(const ASubStrings: TArray<String>);
begin
  fSubstrings := ASubStrings;
end;

function TStringEndsWithAnyIgnoreCase.IsSatisfiedBy(const item: String): Boolean;
var
  LSubstring: String;
begin
  Result := False;
  for LSubstring in fSubstrings do
    if TStringEndsWithIgnoreCase.Create(LSubstring).IsSatisfiedBy(item) then
      Exit(True);
end;

{ TStringCIEndsWith }

constructor TStringEndsWithIgnoreCase.Create(const ASubString: String);
begin
  fSubstring := ASubString;
end;

function TStringEndsWithIgnoreCase.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := item.EndsWith(fSubstring, true);
end;
end.
