unit Tests.Helper.SysUtilsAccess;

interface

uses
  System.SysUtils;

type
  TSysUtilsHelper = class abstract
  public
    class function Split(const AValue: String): TArray<string>;
  end;


implementation

{ TSysUtilsHelper }

class function TSysUtilsHelper.Split(const AValue: String): TArray<string>;
begin
  Result := AValue.Split([',']);
end;

end.
