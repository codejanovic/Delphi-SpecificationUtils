unit Delphi.SpecificationUtils.Common;

interface

uses
  Spring.DesignPatterns,
  System.Rtti,
  Spring;

type
  TCustomSpecification<T> = class(TSpecificationBase<T>)
  protected
    fCustomPredicate: TPredicate<T>;
  public
    constructor Create(const AValue: TPredicate<T>);
    function IsSatisfiedBy(const item: T): Boolean; override;
  end;

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

{ TCustomSpecification<T> }

constructor TCustomSpecification<T>.Create(const AValue: TPredicate<T>);
begin
  fCustomPredicate := AValue;
end;

function TCustomSpecification<T>.IsSatisfiedBy(const item: T): Boolean;
begin
  Result := fCustomPredicate(item);
end;

end.
