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
    function ToHexString: string;
    function ToExtended: Extended;
    function Equals(const AValue: Integer): boolean;
  end;

implementation

uses
  System.SysUtils;

{ TSpecificationIntegerHelper }

function TSpecificationIntegerHelper.Equals(const AValue: Integer): boolean;
begin
  Result := Self = AValue;
end;

function TSpecificationIntegerHelper.ToBoolean: Boolean;
begin
  Result := Self <> 0;
end;

function TSpecificationIntegerHelper.ToExtended: Extended;
begin
  Result := Self;
end;

function TSpecificationIntegerHelper.ToHexString: string;
begin
  Result := System.SysUtils.IntToHex(Self, 0);
end;

function TSpecificationIntegerHelper.ToString: string;
begin
  Result := System.SysUtils.IntToStr(Self);
end;

end.
