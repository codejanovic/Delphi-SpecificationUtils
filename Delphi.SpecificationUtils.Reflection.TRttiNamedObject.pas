unit Delphi.SpecificationUtils.Reflection.TRttiNamedObject;

interface

uses
  Spring.DesignPatterns,
  System.Rtti,
  Spring;

type

  TRttiNamedObjectHasName = class(TSpecificationBase<TRttiNamedObject>)
  protected
    fNameSpecification: ISpecification<String>;
  public
    constructor Create(const ANameSpecification: ISpecification<String>);
    function IsSatisfiedBy(const item: TRttiNamedObject): Boolean; override;
  end;

implementation

{ TRttiNamedObjectHasName }

constructor TRttiNamedObjectHasName.Create(const ANameSpecification: ISpecification<String>);
begin
  Guard.CheckNotNull(ANameSpecification, 'missing Namespecification');
  fNameSpecification := ANameSpecification;
end;

function TRttiNamedObjectHasName.IsSatisfiedBy(const item: TRttiNamedObject): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fNameSpecification.IsSatisfiedBy(item.Name);
end;

end.
