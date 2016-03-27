unit Delphi.SpecificationUtils.Reflection.TClass;

interface

uses
  Spring.DesignPatterns;

type
  TClassHasName = class(TSpecificationBase<TClass>)
  protected
    fNameSpecification: ISpecification<String>;
  public
    constructor Create(const ANameSpecification: ISpecification<String>);
    function IsSatisfiedBy(const item: TClass): Boolean; override;
  end;

implementation

uses
  Spring;

{ TClassHasName }

constructor TClassHasName.Create(const ANameSpecification: ISpecification<String>);
begin
  Guard.CheckNotNull(ANameSpecification, 'missing Specification');
  fNameSpecification := ANameSpecification;
end;

function TClassHasName.IsSatisfiedBy(const item: TClass): Boolean;
begin
  Guard.CheckNotNull(item, 'missing TClass');
  Result := fNameSpecification.IsSatisfiedBy(item.ClassName);
end;

end.
