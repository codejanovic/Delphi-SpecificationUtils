unit Delphi.SpecificationUtils.Integers;

interface

uses
  Spring.DesignPatterns;

type
  TIntegerIsGreaterThan = class(TSpecificationBase<Integer>)
  protected
    fValue: Integer;
  public
    constructor Create(const AValue: Integer);
    function IsSatisfiedBy(const item: Integer): Boolean; override;
  end;

  TIntegerIsLessThan = class(TSpecificationBase<Integer>)
  protected
    fValue: Integer;
  public
    constructor Create(const AValue: Integer);
    function IsSatisfiedBy(const item: Integer): Boolean; override;
  end;

  TIntegerEquals = class(TSpecificationBase<Integer>)
  protected
    fValue: Integer;
  public
    constructor Create(const AValue: Integer);
    function IsSatisfiedBy(const item: Integer): Boolean; override;
  end;

implementation

{ TIntegerIsGreatherThan }

constructor TIntegerIsGreaterThan.Create(const AValue: Integer);
begin
  fValue := AValue;
end;

function TIntegerIsGreaterThan.IsSatisfiedBy(const item: Integer): Boolean;
begin
  Result := item > fValue;
end;

{ TIntegerEquals }

constructor TIntegerEquals.Create(const AValue: Integer);
begin
  fValue := AValue;
end;

function TIntegerEquals.IsSatisfiedBy(const item: Integer): Boolean;
begin
  Result := item = fValue;
end;

{ TIntegerIsLessThan }

constructor TIntegerIsLessThan.Create(const AValue: Integer);
begin
  fValue := AValue;
end;

function TIntegerIsLessThan.IsSatisfiedBy(const item: Integer): Boolean;
begin
  Result := item < fValue;
end;

end.
