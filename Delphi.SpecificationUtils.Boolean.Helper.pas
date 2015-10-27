unit Delphi.SpecificationUtils.Boolean.Helper;

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
    Result := 0
  else
    Result := -1;
end;

function TSpecificationBooleanHelper.ToString: String;
begin
  if Self then
    Result := 'true'
  else
    Result := 'false';
end;

end.
