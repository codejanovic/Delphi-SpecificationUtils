unit Delphi.SpecificationUtils.Strings.CaseSensitive;

interface

uses
  Spring.DesignPatterns,
  Delphi.SpecificationUtils;

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
    fSubstrings: TStringArray;
  public
    constructor Create(const ASubStrings: TStringArray);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringCSEqualsAny = class(TSpecificationBase<String>)
  protected
    fValues: TStringArray;
  public
    constructor Create(const AValues: TStringArray);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

implementation

uses
  Spring,
  System.SysUtils;

{ TContainsSubstring }

constructor TStringCSContainsAny.Create(const ASubStrings: TStringArray);
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

constructor TStringCSEqualsAny.Create(const AValues: TStringArray);
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
  fValue := AValue;
end;

function TStringCSEquals.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := item = fValue;
end;

end.
