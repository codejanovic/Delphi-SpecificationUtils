unit Delphi.SpecificationUtils.RttiType;

interface

uses
  Spring.DesignPatterns,
  System.Rtti,
  Spring;

type
  TRttiTypeHasMember = class(TSpecificationBase<TRttiType>)
  protected
    fHasMemberSpecification: TSpecification<TRttiType>;
    fHasProperty: TSpecification<TRttiType>;
    fHasField: TSpecification<TRttiType>;
    fHasMethod: TSpecification<TRttiType>;
    fNameSpecification: ISpecification<String>;
  public
    constructor Create(const ANameSpecification: ISpecification<String>);
    function IsSatisfiedBy(const item: TRttiType): Boolean; override;
  end;

  TRttiTypeHasProperty = class(TSpecificationBase<TRttiType>)
  protected
    fNameSpecification: ISpecification<String>;
  public
    constructor Create(const ANameSpecification: ISpecification<String>);
    function IsSatisfiedBy(const item: TRttiType): Boolean; override;
  end;

  TRttiTypeHasField = class(TSpecificationBase<TRttiType>)
  protected
    fNameSpecification: ISpecification<String>;
  public
    constructor Create(const ANameSpecification: ISpecification<String>);
    function IsSatisfiedBy(const item: TRttiType): Boolean; override;
  end;

  TRttiTypeHasMethod = class(TSpecificationBase<TRttiType>)
  protected
    fNameSpecification: ISpecification<String>;
  public
    constructor Create(const ANameSpecification: ISpecification<String>);
    function IsSatisfiedBy(const item: TRttiType): Boolean; override;
  end;

  TRttiTypeHasAttribute = class(TSpecificationBase<TRttiType>)
  protected
    fNameSpecification: ISpecification<String>;
  public
    constructor Create(const ANameSpecification: ISpecification<String>);
    function IsSatisfiedBy(const item: TRttiType): Boolean; override;
  end;

  TRttiTypeHasAttributeType<T: TCustomAttribute> = class(TSpecificationBase<TRttiType>)
  public
    function IsSatisfiedBy(const item: TRttiType): Boolean; override;
  end;

implementation

uses
  DSharp.Core.Reflection,
  Delphi.SpecificationUtils.Helper.Strings;


{ TRttiTypeHasMember }

constructor TRttiTypeHasMember.Create(const ANameSpecification: ISpecification<String>);
begin
  Guard.CheckNotNull(ANameSpecification, 'missing Specification');
  fNameSpecification := ANameSpecification;

  fHasProperty := TRttiTypeHasProperty.Create(fNameSpecification);
  fHasField := TRttiTypeHasField.Create(fNameSpecification);
  fHasMethod := TRttiTypeHasMethod.Create(fNameSpecification);

  fHasMemberSpecification := fHasProperty or fHasField or fHasMethod;
end;

function TRttiTypeHasMember.IsSatisfiedBy(const item: TRttiType): Boolean;
begin
  Result := fHasMemberSpecification.IsSatisfiedBy(item);
end;

{ TRttiTypeHasProperty }

constructor TRttiTypeHasProperty.Create(const ANameSpecification: ISpecification<String>);
begin
  Guard.CheckNotNull(ANameSpecification, 'missing Specification');
  fNameSpecification := ANameSpecification;
end;

function TRttiTypeHasProperty.IsSatisfiedBy(const item: TRttiType): Boolean;
var
  LProperty: TRttiProperty;
begin
  Guard.CheckNotNull(item, 'missing RttiType');

  Result := false;

  for LProperty in item.GetProperties do
    if fNameSpecification.IsSatisfiedBy(LProperty.Name) then
      Exit(true);
end;

{ TRttiTypeHasField }

constructor TRttiTypeHasField.Create(const ANameSpecification: ISpecification<String>);
begin
  Guard.CheckNotNull(ANameSpecification, 'missing Specification');
  fNameSpecification := ANameSpecification;
end;

function TRttiTypeHasField.IsSatisfiedBy(const item: TRttiType): Boolean;
var
  LField: TRttiField;
begin
  Guard.CheckNotNull(item, 'missing RttiType');

  Result := false;

  for LField in item.GetFields do
    if fNameSpecification.IsSatisfiedBy(LField.Name) then
      Exit(true);
end;

{ TRttiTypeHasMethod }

constructor TRttiTypeHasMethod.Create(const ANameSpecification: ISpecification<String>);
begin
  Guard.CheckNotNull(ANameSpecification, 'missing Specification');
  fNameSpecification := ANameSpecification;
end;

function TRttiTypeHasMethod.IsSatisfiedBy(const item: TRttiType): Boolean;
var
  LMethod: TRttiMethod;
begin
  Guard.CheckNotNull(item, 'missing RttiType');

  Result := false;

  for LMethod in item.GetMethods do
    if fNameSpecification.IsSatisfiedBy(LMethod.Name) then
      Exit(true);
end;

{ TRttiTypeHasAttribute }

constructor TRttiTypeHasAttribute.Create(const ANameSpecification: ISpecification<String>);
begin
  Guard.CheckNotNull(ANameSpecification, 'missing Specification');
  fNameSpecification := ANameSpecification;
end;

function TRttiTypeHasAttribute.IsSatisfiedBy(const item: TRttiType): Boolean;
var
  LAttributes: TArray<TCustomAttribute>;
  LAttribute: TCustomAttribute;
begin
  Guard.CheckNotNull(item, 'missing RttiType');

  Result := false;
  LAttributes := item.GetCustomAttributes(TCustomAttribute, false);

  for LAttribute in LAttributes do
    if fNameSpecification.IsSatisfiedBy(LAttribute.ClassName.RemoveIgnoreCaseByRegex('attribute$')) then
      Exit(true);
end;

{ TRttiTypeHasAttributeType<T> }

function TRttiTypeHasAttributeType<T>.IsSatisfiedBy(const item: TRttiType): Boolean;
begin
  Guard.CheckNotNull(item, 'missing RttiType');
  Result := Length(item.GetCustomAttributes<T>) > 0;
end;

end.
