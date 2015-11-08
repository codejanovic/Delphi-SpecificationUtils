unit Delphi.SpecificationUtils.Helper.Boolean;

interface

type
  TSpecificationBooleanHelper = record helper for Boolean
  public
    function ToInteger: Integer;
    function ToString: String;
  end;

implementation

{ TSpecificationBooleanHelper }

function TSpecificationBooleanHelper.ToInteger: Integer;
begin
  if Self then
    Result := 1
  else
    Result := 0;
end;

function TSpecificationBooleanHelper.ToString: String;
begin
  if Self then
    Result := 'true'
  else
    Result := 'false';
end;

end.
