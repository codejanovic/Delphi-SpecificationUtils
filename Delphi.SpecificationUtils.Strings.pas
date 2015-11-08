unit Delphi.SpecificationUtils.Strings;

interface

uses
  Spring.DesignPatterns, System.RegularExpressions;

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

  TStringIsEmpty = class(TSpecificationBase<String>)
  public
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringMatchesRegex = class(TSpecificationBase<String>)
  protected
    fExpression: String;
    fOptions: TRegExOptions;
  public
    constructor Create(const AExpression: String; const AOptions: TRegExOptions);
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringIsBoolean = class(TSpecificationBase<String>)
  protected
    fRegExSpec: ISpecification<String>;
  protected const
    fRegExExpression = '^true$|^false$';
    fRegExOptions = [roSingleLine, roIgnoreCase];
  public
    constructor Create;
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringIsInteger = class(TSpecificationBase<String>)
  protected
    fRegExSpec: ISpecification<String>;
  protected const
    fRegExExpression = '^[+-]?\d+$';
    fRegExOptions = [roSingleLine];
  public
    constructor Create;
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringIsFloat = class(TSpecificationBase<String>)
  protected
    fRegExSpec: ISpecification<String>;
  protected const
    fRegExExpression = '^[-+]?[0-9]*\.?[0-9]*$';
    fRegExOptions = [roSingleLine];
  public
    constructor Create;
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

  TStringIsGUID = class(TSpecificationBase<String>)
  protected
    fRegExSpec: ISpecification<String>;
  protected const
    fRegExExpression = '(\{){0,1}[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}(\}){0,1}';
    fRegExOptions = [roSingleLine];
  public
    constructor Create;
    function IsSatisfiedBy(const item: String): Boolean; override;
  end;

implementation

uses
  System.SysUtils, System.Rtti,
  Delphi.SpecificationUtils.Strings.IgnoreCase,
  Spring.Collections;

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

{ TStringIsEmpty }

function TStringIsEmpty.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := item.Trim.IsEmpty;
end;

{ TStringIsType<T> }

constructor TStringIsBoolean.Create;
begin
  fRegExSpec := TStringMatchesRegEx.Create(fRegExExpression, fRegExOptions);
end;

function TStringIsBoolean.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := fRegExSpec.IsSatisfiedBy(item.Trim);
end;

{ TStringMatchesRegex }

constructor TStringMatchesRegex.Create(const AExpression: String; const AOptions: TRegExOptions);
begin
  fExpression := AExpression;
  fOptions := AOptions;
end;

function TStringMatchesRegex.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := TRegEx.IsMatch(item, fExpression, fOptions);
end;

{ TStringIsInteger }

constructor TStringIsInteger.Create;
begin
  fRegExSpec := TStringMatchesRegEx.Create(fRegExExpression, fRegExOptions);
end;

function TStringIsInteger.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := fRegExSpec.IsSatisfiedBy(item.Trim);
end;

{ TStringIsFloat }

constructor TStringIsFloat.Create;
begin
  fRegExSpec := TStringMatchesRegEx.Create(fRegExExpression, fRegExOptions);
end;

function TStringIsFloat.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := fRegExSpec.IsSatisfiedBy(item.Trim);
end;

{ TStringIsGUID }

constructor TStringIsGUID.Create;
begin
   fRegExSpec := TStringMatchesRegEx.Create(fRegExExpression, fRegExOptions);
end;

function TStringIsGUID.IsSatisfiedBy(const item: String): Boolean;
begin
  Result := fRegExSpec.IsSatisfiedBy(item.Trim);
end;

end.
