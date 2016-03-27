unit Delphi.SpecificationUtils.Common.Factory;

interface

uses
  Delphi.SpecificationUtils,
  Spring.DesignPatterns;

type
  TCommonSpecificationsFactory = class(TInterfacedObject, ICommonSpecifications)
  public
    function IsNull: TSpecification<TObject>;
    function IsNulli: TSpecification<IInterface>;
  end;

implementation

uses
  Delphi.SpecificationUtils.Common;

{ TCommonSpecificationsFactory }

function TCommonSpecificationsFactory.IsNull: TSpecification<TObject>;
begin
  Result := TObjectIsNull.Create;
end;

function TCommonSpecificationsFactory.IsNulli: TSpecification<IInterface>;
begin
  Result := TInterfaceIsNull.Create;
end;

end.
