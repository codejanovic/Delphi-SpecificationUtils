unit Delphi.SpecificationUtils.Common;

interface

uses
  Spring.DesignPatterns,
  System.Rtti,
  Spring;

type
  TObjectIsNull = class(TSpecificationBase<TObject>)
  public
    function IsSatisfiedBy(const item: TObject): Boolean; override;
  end;

  TInterfaceIsNull = class(TSpecificationBase<IInterface>)
  public
    function IsSatisfiedBy(const item: IInterface): Boolean; override;
  end;

implementation


{ TObjectIsNull<T> }

function TObjectIsNull.IsSatisfiedBy(const item: TObject): Boolean;
begin
  Result := not Assigned(item);
end;

{ TInterfaceIsNull<T> }

function TInterfaceIsNull.IsSatisfiedBy(const item: IInterface): Boolean;
begin
  Result := not Assigned(item);
end;

end.
