unit Delphi.SpecificationUtils.Helper.TGUID;

interface

type
  TSpecificationGUIDHelper = record helper for TGUID
  public
    {$IFDEF MSWINDOWS}
    class function CreateNewGUID: TGUID; static;
    procedure ReCreate;
    {$ENDIF}
    function ToString: String;
    function Equals(const AValue: TGUID): boolean;
  end;

implementation

uses
  System.SysUtils,
  Delphi.SpecificationUtils.TGUID;

{ TSpecificationGUIDHelper }

{$IFDEF MSWINDOWS}
class function TSpecificationGUIDHelper.CreateNewGUID: TGUID;
begin
  CreateGuid(Result);
end;

procedure TSpecificationGUIDHelper.ReCreate;
begin
  Self := CreateNewGUID;
end;
{$ENDIF}

function TSpecificationGUIDHelper.Equals(const AValue: TGUID): boolean;
begin
  Result := TGUIDIsEqual.Create(AValue).IsSatisfiedBy(Self);
end;

function TSpecificationGUIDHelper.ToString: String;
begin
  Result := System.SysUtils.GUIDToString(Self);
end;

end.
