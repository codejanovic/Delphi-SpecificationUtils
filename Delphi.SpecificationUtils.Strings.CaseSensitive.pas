unit Delphi.SpecificationUtils.Strings.CaseSensitive;

interface

uses
  Spring.DesignPatterns;

type
  TStringCSContains = class(TSpecificationBase<String>)
  protected
    fSubstring: String;
  public
    constructor Create(const ASubString: String);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringCSEquals = class(TSpecificationBase<String>)
  protected
    fValue: String;
  public
    constructor Create(const AValue: String);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringCSContainsAny = class(TSpecificationBase<String>)
  protected
    fSubstrings: TArray<String>;
  public
    constructor Create(const ASubStrings: TArray<String>);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringCSEqualsAny = class(TSpecificationBase<String>)
  protected
    fValues: TArray<String>;
  public
    constructor Create(const AValues: TArray<String>);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringCSStartsWith = class(TSpecificationBase<String>)
  protected
    fSubstring: String;
  public
    constructor Create(const ASubString: String);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringCSStartsWithAny = class(TSpecificationBase<String>)
  protected
    fSubstrings: TArray<String>;
  public
    constructor Create(const ASubStrings: TArray<String>);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringCSEndsWith = class(TSpecificationBase<String>)
  protected
    fSubstring: String;
  public
    constructor Create(const ASubString: String);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringCSEndsWithAny = class(TSpecificationBase<String>)
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

constructor TStringCSContainsAny.Create(const ASubStrings: TArray<String>);
begin
  Guard.CheckFalse(Length(ASubStrings) = 0);
  fSubstrings := ASubStrings;
end;

function TStringCSContainsAny.IsSatisfiedBy(const item: String): Boolean;
var
  LSubstring: String;
begin
  Result := False;
  for LSubstring in fSubstrings do
    if TStringCSContains.Create(LSubstring).IsSatisfiedBy(item) then
      Exit(True);
end;

{ TEqualsString }

constructor TStringCSEqualsAny.Create(const AValues: TArray<String>);
begin
  Guard.CheckFalse(Length(AValues) = 0);
  fValues := AValues;
end;

function TStringCSEqualsAny.IsSatisfiedBy(const item: String): Boolean;
var
  LValue: String;
begin
  Result := False;
  for LValue in fValues do
    if TStringCSEquals.Create(LValue).IsSatisfiedBy(item) then
      Exit(True);
end;

{ TStringContains }

constructor TStringCSContains.Create(const ASubString: String);
begin
  fSubstring := ASubString;
end;

function TStringCSContains.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := System.Pos(fSubstring, item) > 0;
end;

{ TStringEqualsCaseSensitive }

constructor TStringCSEquals.Create(const AValue: String);
begin
  fValue := AValue.Trim;
end;

function TStringCSEquals.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := item.Trim = fValue;
end;

{ TStringCSStartsWith }

constructor TStringCSStartsWith.Create(const ASubString: String);
begin
  fSubstring := ASubString;
end;

function TStringCSStartsWith.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := item.StartsWith(fSubstring, false);
end;

{ TStringCSStartsWithAny }

constructor TStringCSStartsWithAny.Create(const ASubStrings: TArray<String>);
begin
  fSubstrings := ASubStrings;
end;

function TStringCSStartsWithAny.IsSatisfiedBy(const item: String): Boolean;
var
  LSubstring: String;
begin
  Result := False;
  for LSubstring in fSubstrings do
    if TStringCSStartsWith.Create(LSubstring).IsSatisfiedBy(item) then
      Exit(True);
end;

{ TStringCSEndsWithAny }

constructor TStringCSEndsWithAny.Create(const ASubStrings: TArray<String>);
begin
  fSubstrings := ASubStrings;
end;

function TStringCSEndsWithAny.IsSatisfiedBy(const item: String): Boolean;
var
  LSubstring: String;
begin
  Result := False;
  for LSubstring in fSubstrings do
    if TStringCSEndsWith.Create(LSubstring).IsSatisfiedBy(item) then
      Exit(True);
end;

{ TStringCSEndsWith }

constructor TStringCSEndsWith.Create(const ASubString: String);
begin
  fSubstring := ASubString;
end;

function TStringCSEndsWith.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := item.EndsWith(fSubstring, false);
end;

end.
