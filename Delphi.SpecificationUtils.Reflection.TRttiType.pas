unit Delphi.SpecificationUtils.Reflection.TRttiType;

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

  TRttiTypeHasAttributeType = class(TSpecificationBase<TRttiType>)
  protected
    fClass: TAttributeClass;
  public
    constructor Create(const AValue: TAttributeClass);
    function IsSatisfiedBy(const item: TRttiType): Boolean; override;
  end;

  TRttiTypeHasAttributeType<T: TCustomAttribute> = class(TSpecificationBase<TRttiType>)
  public
    function IsSatisfiedBy(const item: TRttiType): Boolean; override;
  end;

  TRttiTypeIsManaged = class(TSpecificationBase<TRttiType>)
  public
    function IsSatisfiedBy(const item: TRttiType): Boolean; override;
  end;

  TRttiTypeIsInstance = class(TSpecificationBase<TRttiType>)
  public
    function IsSatisfiedBy(const item: TRttiType): Boolean; override;
  end;

  TRttiTypeIsOrdinal = class(TSpecificationBase<TRttiType>)
  public
    function IsSatisfiedBy(const item: TRttiType): Boolean; override;
  end;

  TRttiTypeIsRecord = class(TSpecificationBase<TRttiType>)
  public
    function IsSatisfiedBy(const item: TRttiType): Boolean; override;
  end;

  TRttiTypeIsSet = class(TSpecificationBase<TRttiType>)
  public
    function IsSatisfiedBy(const item: TRttiType): Boolean; override;
  end;

  TRttiTypeIsPublicType = class(TSpecificationBase<TRttiType>)
  public
    function IsSatisfiedBy(const item: TRttiType): Boolean; override;
  end;

  TRttiTypeIsInstanceType = class(TSpecificationBase<TRttiType>)
  public
    function IsSatisfiedBy(const item: TRttiType): Boolean; override;
  end;


implementation

uses
  Spring.Reflection,
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
  Guard.CheckNotNull(item, 'missing item');

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
  Guard.CheckNotNull(item, 'missing item');

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
  Guard.CheckNotNull(item, 'missing item');

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
  Guard.CheckNotNull(item, 'missing item');

  Result := false;
  LAttributes := item.GetCustomAttributes(TCustomAttribute, false);

  for LAttribute in LAttributes do
    if fNameSpecification.IsSatisfiedBy(LAttribute.ClassName.RemoveIgnoreCaseByRegex('attribute$')) then
      Exit(true);
end;

{ TRttiTypeHasAttributeType<T> }

function TRttiTypeHasAttributeType<T>.IsSatisfiedBy(const item: TRttiType): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := Length(item.GetCustomAttributes<T>) > 0;
end;

{ TRttiTypeIsManaged }

function TRttiTypeIsManaged.IsSatisfiedBy(const item: TRttiType): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := item.IsManaged;
end;

{ TRttiTypeIsInstance }

function TRttiTypeIsInstance.IsSatisfiedBy(const item: TRttiType): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := item.IsInstance;
end;

{ TRttiTypeIsOrdinal }

function TRttiTypeIsOrdinal.IsSatisfiedBy(const item: TRttiType): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := item.IsOrdinal;
end;

{ TRttiTypeIsRecord }

function TRttiTypeIsRecord.IsSatisfiedBy(const item: TRttiType): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := item.IsRecord;
end;

{ TRttiTypeIsSet }

function TRttiTypeIsSet.IsSatisfiedBy(const item: TRttiType): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := item.IsSet;
end;

{ TRttiTypeIsPublicType }

function TRttiTypeIsPublicType.IsSatisfiedBy(const item: TRttiType): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := item.IsPublicType;
end;

{ TRttiTypeIsInstanceType }

function TRttiTypeIsInstanceType.IsSatisfiedBy(const item: TRttiType): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := item is TRttiInstanceType;
end;

{ TRttiTypeHasAttributeType }

constructor TRttiTypeHasAttributeType.Create(const AValue: TAttributeClass);
begin
  fClass := AValue;
end;

function TRttiTypeHasAttributeType.IsSatisfiedBy(const item: TRttiType): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := Length(item.GetCustomAttributes(fClass)) > 0;
end;

end.
