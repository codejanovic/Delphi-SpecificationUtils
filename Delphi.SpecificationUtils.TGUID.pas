unit Delphi.SpecificationUtils.TGUID;

interface

uses
  Spring.DesignPatterns;

type
  TGUIDEquals = class(TSpecificationBase<TGUID>)
  protected
    fValue: TGUID;
  public
    constructor Create(const AValue: TGUID);
    function IsSatisfiedBy(const item: TGUID): Boolean; override;
  end;

implementation

uses
  System.SysUtils;

{ TGUIDEquals }

constructor TGUIDEquals.Create(const AValue: TGUID);
begin
  fValue := AValue;
end;

function TGUIDEquals.IsSatisfiedBy(const item: TGUID): Boolean;
begin
  Result := System.SysUtils.IsEqualGUID(fValue, item);
end;

end.
