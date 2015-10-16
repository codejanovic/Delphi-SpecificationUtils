unit Delphi.SpecificationUtils.TGUID;

interface

uses
  Spring.DesignPatterns;

type
  TGUIDIsEqual = class(TSpecificationBase<TGUID>)
  protected
    fValue: TGUID;
  public
    constructor Create(const AValue: TGUID);
    function IsSatisfiedBy(const item: TGUID): Boolean; override;
  end;

implementation

uses
  System.SysUtils;

{ TGUIDIsEqual }

constructor TGUIDIsEqual.Create(const AValue: TGUID);
begin
  fValue := AValue;
end;

function TGUIDIsEqual.IsSatisfiedBy(const item: TGUID): Boolean;
begin
  Result := System.SysUtils.IsEqualGUID(fValue, item);
end;

end.
