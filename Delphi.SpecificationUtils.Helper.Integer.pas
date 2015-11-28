unit Delphi.SpecificationUtils.Helper.Integer;

interface

type
  TSpecificationIntegerHelper = record helper for Integer
  public const
      MaxValue = 2147483647;
      MinValue = -2147483648;
  public
    function ToString: string;
    function ToBoolean: Boolean;
    function ToHex(const ADigits: Integer): string;
    function ToExtended: Extended;
    function Equals(const AValue: Integer): boolean;
    function IsGreaterThan(const AValue: Integer): Boolean;
    function IsGreaterThanOrEquals(const AValue: Integer): Boolean;
    function IsLessThan(const AValue: Integer): Boolean;
    function IsLessThanOrEquals(const AValue: Integer): Boolean;
  end;

implementation

uses
  System.SysUtils,
  Delphi.SpecificationUtils.Integers,
  Spring.DesignPatterns;

{ TSpecificationIntegerHelper }

function TSpecificationIntegerHelper.Equals(const AValue: Integer): boolean;
begin
  Result := Self = AValue;
end;

function TSpecificationIntegerHelper.IsGreaterThan(const AValue: Integer): Boolean;
begin
  Result := Self > AValue;
end;

function TSpecificationIntegerHelper.IsGreaterThanOrEquals(const AValue: Integer): Boolean;
begin
  Result := Self >= AValue;
end;

function TSpecificationIntegerHelper.IsLessThan(const AValue: Integer): Boolean;
begin
  Result := Self < AValue;
end;

function TSpecificationIntegerHelper.IsLessThanOrEquals(const AValue: Integer): Boolean;
begin
  Result := Self <= AValue;
end;

function TSpecificationIntegerHelper.ToBoolean: Boolean;
begin
  Result := Self <> 0;
end;

function TSpecificationIntegerHelper.ToExtended: Extended;
begin
  Result := Self;
end;

function TSpecificationIntegerHelper.ToHex(const ADigits: Integer): string;
begin
  Result := System.SysUtils.IntToHex(Self, ADigits);
end;

function TSpecificationIntegerHelper.ToString: string;
begin
  Result := System.SysUtils.IntToStr(Self);
end;

end.
