unit Delphi.SpecificationUtils.Reflection.TRttiInstanceType;

interface

uses
  Spring.DesignPatterns, System.Rtti;

type
  TRttiInstanceTypeImplementsByName = class(TSpecificationBase<TRttiInstanceType>)
  protected
    fNameSpecification: ISpecification<String>;
  public
    constructor Create(const ANameSpecification: ISpecification<String>);
    function IsSatisfiedBy(const item: TRttiInstanceType): Boolean; override;
  end;

implementation

uses
  Spring;

{ TRttiInstanceTypeImplementsByName }

constructor TRttiInstanceTypeImplementsByName.Create(const ANameSpecification: ISpecification<String>);
begin
  Guard.CheckNotNull(ANameSpecification, 'missing Specification');
  fNameSpecification := ANameSpecification;
end;

function TRttiInstanceTypeImplementsByName.IsSatisfiedBy(const item: TRttiInstanceType): Boolean;
var
  LImplementedInterface: TRttiInterfaceType;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := false;
  for LImplementedInterface in item.GetImplementedInterfaces do
    if fNameSpecification.IsSatisfiedBy(LImplementedInterface.Name) then
      Exit(true);
end;

end.
