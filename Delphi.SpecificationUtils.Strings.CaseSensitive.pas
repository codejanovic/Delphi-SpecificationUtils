unit Delphi.SpecificationUtils.Strings.CaseSensitive;

interface

uses
  Spring.DesignPatterns;

type
  TStringContains = class(TSpecificationBase<String>)
  protected
    fSubstring: String;
  public
    constructor Create(const ASubString: String);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringEquals = class(TSpecificationBase<String>)
  protected
    fValue: String;
  public
    constructor Create(const AValue: String);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringContainsAny = class(TSpecificationBase<String>)
  protected
    fSubstrings: TArray<String>;
  public
    constructor Create(const ASubStrings: TArray<String>);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringEqualsAny = class(TSpecificationBase<String>)
  protected
    fValues: TArray<String>;
  public
    constructor Create(const AValues: TArray<String>);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringStartsWith = class(TSpecificationBase<String>)
  protected
    fSubstring: String;
  public
    constructor Create(const ASubString: String);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringStartsWithAny = class(TSpecificationBase<String>)
  protected
    fSubstrings: TArray<String>;
  public
    constructor Create(const ASubStrings: TArray<String>);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringEndsWith = class(TSpecificationBase<String>)
  protected
    fSubstring: String;
  public
    constructor Create(const ASubString: String);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringEndsWithAny = class(TSpecificationBase<String>)
  protected
    fSubstrings: TArray<String>;
  public
    constructor Create(const ASubStrings: TArray<String>);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

implementation

uses
  Spring,
  System.SysUtils;

{ TContainsSubstring }

constructor TStringContainsAny.Create(const ASubStrings: TArray<String>);
begin
  Guard.CheckFalse(Length(ASubStrings) = 0);
  fSubstrings := ASubStrings;
end;

function TStringContainsAny.IsSatisfiedBy(const item: String): Boolean;
var
  LSubstring: String;
begin
  Result := False;
  for LSubstring in fSubstrings do
    if TStringContains.Create(LSubstring).IsSatisfiedBy(item) then
      Exit(True);
end;

{ TEqualsString }

constructor TStringEqualsAny.Create(const AValues: TArray<String>);
begin
  Guard.CheckFalse(Length(AValues) = 0);
  fValues := AValues;
end;

function TStringEqualsAny.IsSatisfiedBy(const item: String): Boolean;
var
  LValue: String;
begin
  Result := False;
  for LValue in fValues do
    if TStringEquals.Create(LValue).IsSatisfiedBy(item) then
      Exit(True);
end;

{ TStringContains }

constructor TStringContains.Create(const ASubString: String);
begin
  fSubstring := ASubString;
end;

function TStringContains.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := System.Pos(fSubstring, item) > 0;
end;

{ TStringEqualsCaseSensitive }

constructor TStringEquals.Create(const AValue: String);
begin
  fValue := AValue.Trim;
end;

function TStringEquals.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := item.Trim = fValue;
end;

{ TStringCSStartsWith }

constructor TStringStartsWith.Create(const ASubString: String);
begin
  fSubstring := ASubString;
end;

function TStringStartsWith.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := item.StartsWith(fSubstring, false);
end;

{ TStringCSStartsWithAny }

constructor TStringStartsWithAny.Create(const ASubStrings: TArray<String>);
begin
  fSubstrings := ASubStrings;
end;

function TStringStartsWithAny.IsSatisfiedBy(const item: String): Boolean;
var
  LSubstring: String;
begin
  Result := False;
  for LSubstring in fSubstrings do
    if TStringStartsWith.Create(LSubstring).IsSatisfiedBy(item) then
      Exit(True);
end;

{ TStringCSEndsWithAny }

constructor TStringEndsWithAny.Create(const ASubStrings: TArray<String>);
begin
  fSubstrings := ASubStrings;
end;

function TStringEndsWithAny.IsSatisfiedBy(const item: String): Boolean;
var
  LSubstring: String;
begin
  Result := False;
  for LSubstring in fSubstrings do
    if TStringEndsWith.Create(LSubstring).IsSatisfiedBy(item) then
      Exit(True);
end;

{ TStringCSEndsWith }

constructor TStringEndsWith.Create(const ASubString: String);
begin
  fSubstring := ASubString;
end;

function TStringEndsWith.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := item.EndsWith(fSubstring, false);
end;

end.
