unit Delphi.SpecificationUtils.Strings;

interface

uses
  Spring.DesignPatterns;

type
  TStringHasLength = class(TSpecificationBase<String>)
  protected
    fLength: Integer;
  public
    constructor Create(const ALength: Integer);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringHasLengthGreatherThan = class(TSpecificationBase<String>)
  protected
    fMinLength: Integer;
  public
    constructor Create(const AMinLength: Integer);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringHasLengthLessThan = class(TSpecificationBase<String>)
  protected
    fMaxLength: Integer;
  public
    constructor Create(const AMaxLength: Integer);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

implementation

uses
  System.SysUtils;

{ TStringHasLength }

constructor TStringHasLength.Create(const ALength: Integer);
begin
  fLength := ALength;
end;

function TStringHasLength.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := Length(item) = fLength;
end;

{ TStringHasLengthGreatherThan }

constructor TStringHasLengthGreatherThan.Create(const AMinLength: Integer);
begin
  fMinLength := AMinLength;
end;

function TStringHasLengthGreatherThan.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := Length(item) > fMinLength;
end;

{ TStringHasLengthLessThan }

constructor TStringHasLengthLessThan.Create(const AMaxLength: Integer);
begin
  fMaxLength := AMaxLength;
end;

function TStringHasLengthLessThan.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := Length(item) < fMaxLength;
end;

end.
