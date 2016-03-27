unit Delphi.SpecificationUtils.Reflection.TRttiProperty;

interface

uses
  Spring.DesignPatterns,
  System.Rtti,
  Spring, System.TypInfo, Delphi.SpecificationUtils;

type
  TRttiPropertyHasAttribute = class(TSpecificationBase<TRttiProperty>)
  protected
    fHasAttribute: ISpecification<TRttiMember>;
  public
    constructor Create(const ANameSpecification: ISpecification<String>);
    function IsSatisfiedBy(const item: TRttiProperty): Boolean; override;
  end;

  TRttiPropertyHasAttributeType<T: TCustomAttribute> = class(TSpecificationBase<TRttiProperty>)
  protected
  	fHasAttributeType: ISpecification<TRttiMember>;
  public
  	constructor Create;
    function IsSatisfiedBy(const item: TRttiProperty): Boolean; override;
  end;

  TRttiPropertyHasAttributeType = class(TSpecificationBase<TRttiProperty>)
  protected
    fHasAttributeType: ISpecification<TRttiMember>;
  public
    constructor Create(const AValue: TClass);
    function IsSatisfiedBy(const item: TRttiProperty): Boolean; override;
  end;

  TRttiPropertyIsInstance = class(TSpecificationBase<TRttiProperty>)
  public
    function IsSatisfiedBy(const item: TRttiProperty): Boolean; override;
  end;

  TRttiPropertyTypeIsManaged = class(TSpecificationBase<TRttiProperty>)
  protected
    fIsManaged: ISpecification<TRttiType>;
  public
    constructor Create;
    function IsSatisfiedBy(const item: TRttiProperty): Boolean; override;
  end;

  TRttiPropertyTypeIsInstance = class(TSpecificationBase<TRttiProperty>)
  protected
    fIsInstance: ISpecification<TRttiType>;
  public
    constructor Create;
    function IsSatisfiedBy(const item: TRttiProperty): Boolean; override;
  end;

  TRttiPropertyTypeIsOrdinal = class(TSpecificationBase<TRttiProperty>)
  protected
    fIsOrdinal: ISpecification<TRttiType>;
  public
    constructor Create;
    function IsSatisfiedBy(const item: TRttiProperty): Boolean; override;
  end;

  TRttiPropertyTypeIsRecord = class(TSpecificationBase<TRttiProperty>)
  protected
    fIsRecord: ISpecification<TRttiType>;
  public
    constructor Create;
    function IsSatisfiedBy(const item: TRttiProperty): Boolean; override;
  end;

  TRttiPropertyTypeIsSet = class(TSpecificationBase<TRttiProperty>)
  protected
    fIsSet: ISpecification<TRttiType>;
  public
    constructor Create;
    function IsSatisfiedBy(const item: TRttiProperty): Boolean; override;
  end;

  TRttiPropertyTypeIsPublicType = class(TSpecificationBase<TRttiProperty>)
  protected
    fIsPublicType: ISpecification<TRttiType>;
  public
    constructor Create;
    function IsSatisfiedBy(const item: TRttiProperty): Boolean; override;
  end;

  TRttiPropertyHasVisibility = class(TSpecificationBase<TRttiProperty>)
  protected
    fHasVisibilities: ISpecification<TRttiMember>;
  public
    constructor Create(const AVisibilities: TMemberVisibilities);
    function IsSatisfiedBy(const item: TRttiProperty): Boolean; override;
  end;


implementation

uses
  Delphi.SpecificationUtils.Reflection.TRttiType, Delphi.SpecificationUtils.Reflection.TRttiMember;


{ TRttiPropertyIsInstance }

function TRttiPropertyIsInstance.IsSatisfiedBy(const item: TRttiProperty): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := item is TRttiInstanceProperty;
end;

{ TRttiPropertyTypeIsManaged }

constructor TRttiPropertyTypeIsManaged.Create;
begin
  fIsManaged := TRttiTypeIsManaged.Create;
end;

function TRttiPropertyTypeIsManaged.IsSatisfiedBy(const item: TRttiProperty): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fIsManaged.IsSatisfiedBy(item.PropertyType);
end;

{ TRttiPropertyTypeIsInstance }

constructor TRttiPropertyTypeIsInstance.Create;
begin
  fIsInstance := TRttiTypeIsInstance.Create;
end;

function TRttiPropertyTypeIsInstance.IsSatisfiedBy(const item: TRttiProperty): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fIsInstance.IsSatisfiedBy(item.PropertyType)
end;

{ TRttiPropertyTypeIsOrdinal }

constructor TRttiPropertyTypeIsOrdinal.Create;
begin
  fIsOrdinal := TRttiTypeIsOrdinal.Create;
end;

function TRttiPropertyTypeIsOrdinal.IsSatisfiedBy(const item: TRttiProperty): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fIsOrdinal.IsSatisfiedBy(item.PropertyType);
end;

{ TRttiPropertyTypeIsRecord }

constructor TRttiPropertyTypeIsRecord.Create;
begin
  fIsRecord := TRttiTypeIsRecord.Create;
end;

function TRttiPropertyTypeIsRecord.IsSatisfiedBy(const item: TRttiProperty): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fIsRecord.IsSatisfiedBy(item.PropertyType)
end;

{ TRttiPropertyTypeIsSet }

constructor TRttiPropertyTypeIsSet.Create;
begin
  fIsSet := TRttiTypeIsSet.Create;
end;

function TRttiPropertyTypeIsSet.IsSatisfiedBy(const item: TRttiProperty): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fIsSet.IsSatisfiedBy(item.PropertyType);
end;

{ TRttiPropertyTypeIsPublicType }

constructor TRttiPropertyTypeIsPublicType.Create;
begin
  fIsPublicType := TRttiTypeIsPublicType.Create;
end;

function TRttiPropertyTypeIsPublicType.IsSatisfiedBy(const item: TRttiProperty): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fIsPublicType.IsSatisfiedBy(item.PropertyType)
end;

{ TRttiPropertyHasAttribute }

constructor TRttiPropertyHasAttribute.Create(const ANameSpecification: ISpecification<String>);
begin
  fHasAttribute := TRttiMemberHasAttribute.Create(ANameSpecification);
end;

function TRttiPropertyHasAttribute.IsSatisfiedBy(const item: TRttiProperty): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fHasAttribute.IsSatisfiedBy(item);
end;

{ TRttiPropertyHasAttributeType<T> }

constructor TRttiPropertyHasAttributeType<T>.Create;
begin
  fHasAttributeType := TRttiMemberHasAttributeType<T>.Create;
end;

function TRttiPropertyHasAttributeType<T>.IsSatisfiedBy(const item: TRttiProperty): Boolean;
begin
  Result := fHasAttributeType.IsSatisfiedBy(item);
end;

{ TRttiPropertyHasAttributeType }

constructor TRttiPropertyHasAttributeType.Create(const AValue: TClass);
begin
  fHasAttributeType := TRttiMemberHasAttributeType.Create(AValue);
end;

function TRttiPropertyHasAttributeType.IsSatisfiedBy(const item: TRttiProperty): Boolean;
begin
  Result := fHasAttributeType.IsSatisfiedBy(item);
end;

{ TRttiPropertyHasVisibility }

constructor TRttiPropertyHasVisibility.Create(const AVisibilities: TMemberVisibilities);
begin
  fHasVisibilities := TRttiMemberHasVisibility.Create(AVisibilities);
end;

function TRttiPropertyHasVisibility.IsSatisfiedBy(const item: TRttiProperty): Boolean;
begin
  Result := fHasVisibilities.IsSatisfiedBy(item);
end;

end.
