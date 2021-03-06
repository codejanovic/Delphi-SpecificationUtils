unit Delphi.SpecificationUtils.Reflection.TRttiField;

interface

uses
  Spring.DesignPatterns,
  System.Rtti,
  Spring, Delphi.SpecificationUtils;

type
  TRttiFieldHasAttribute = class(TSpecificationBase<TRttiField>)
  protected
    fHasAttribute: ISpecification<TRttiMember>;
  public
    constructor Create(const ANameSpecification: ISpecification<String>);
    function IsSatisfiedBy(const item: TRttiField): Boolean; override;
  end;

  TRttiFieldHasAttributeType<T: TCustomAttribute> = class(TSpecificationBase<TRttiField>)
  protected
  	fHasAttributeType: ISpecification<TRttiMember>;
  public
  	constructor Create;
    function IsSatisfiedBy(const item: TRttiField): Boolean; override;
  end;

  TRttiFieldHasAttributeType = class(TSpecificationBase<TRttiField>)
  protected
    fHasAttributeType: ISpecification<TRttiMember>;
  public
    constructor Create(const AValue: TAttributeClass);
    function IsSatisfiedBy(const item: TRttiField): Boolean; override;
  end;

  TRttiFieldTypeIsManaged = class(TSpecificationBase<TRttiField>)
  protected
    fIsManaged: ISpecification<TRttiType>;
  public
    constructor Create;
    function IsSatisfiedBy(const item: TRttiField): Boolean; override;
  end;

  TRttiFieldTypeIsInstance = class(TSpecificationBase<TRttiField>)
  protected
    fIsInstance: ISpecification<TRttiType>;
  public
    constructor Create;
    function IsSatisfiedBy(const item: TRttiField): Boolean; override;
  end;

  TRttiFieldTypeIsOrdinal = class(TSpecificationBase<TRttiField>)
  protected
    fIsOrdinal: ISpecification<TRttiType>;
  public
    constructor Create;
    function IsSatisfiedBy(const item: TRttiField): Boolean; override;
  end;

  TRttiFieldTypeIsRecord = class(TSpecificationBase<TRttiField>)
  protected
    fIsRecord: ISpecification<TRttiType>;
  public
    constructor Create;
    function IsSatisfiedBy(const item: TRttiField): Boolean; override;
  end;

  TRttiFieldTypeIsSet = class(TSpecificationBase<TRttiField>)
  protected
    fIsSet: ISpecification<TRttiType>;
  public
    constructor Create;
    function IsSatisfiedBy(const item: TRttiField): Boolean; override;
  end;

  TRttiFieldTypeIsPublicType = class(TSpecificationBase<TRttiField>)
  protected
    fIsPublicType: ISpecification<TRttiType>;
  public
    constructor Create;
    function IsSatisfiedBy(const item: TRttiField): Boolean; override;
  end;

  TRttiFieldHasVisibility = class(TSpecificationBase<TRttiField>)
  protected
    fHasVisibilities: ISpecification<TRttiMember>;
  public
    constructor Create(const AVisibilities: TMemberVisibilities);
    function IsSatisfiedBy(const item: TRttiField): Boolean; override;
  end;

implementation

uses
  Delphi.SpecificationUtils.Reflection.TRttiType, Delphi.SpecificationUtils.Reflection.TRttiMember;


{ TRttiFieldTypeIsManaged }

constructor TRttiFieldTypeIsManaged.Create;
begin
  fIsManaged := TRttiTypeIsManaged.Create;
end;

function TRttiFieldTypeIsManaged.IsSatisfiedBy(const item: TRttiField): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fIsManaged.IsSatisfiedBy(item.FieldType);
end;

{ TRttiFieldTypeIsInstance }

constructor TRttiFieldTypeIsInstance.Create;
begin
  fIsInstance := TRttiTypeIsInstance.Create;
end;

function TRttiFieldTypeIsInstance.IsSatisfiedBy(const item: TRttiField): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fIsInstance.IsSatisfiedBy(item.FieldType)
end;

{ TRttiFieldTypeIsOrdinal }

constructor TRttiFieldTypeIsOrdinal.Create;
begin
  fIsOrdinal := TRttiTypeIsOrdinal.Create;
end;

function TRttiFieldTypeIsOrdinal.IsSatisfiedBy(const item: TRttiField): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fIsOrdinal.IsSatisfiedBy(item.FieldType);
end;

{ TRttiFieldTypeIsRecord }

constructor TRttiFieldTypeIsRecord.Create;
begin
  fIsRecord := TRttiTypeIsRecord.Create;
end;

function TRttiFieldTypeIsRecord.IsSatisfiedBy(const item: TRttiField): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fIsRecord.IsSatisfiedBy(item.FieldType)
end;

{ TRttiFieldTypeIsSet }

constructor TRttiFieldTypeIsSet.Create;
begin
  fIsSet := TRttiTypeIsSet.Create;
end;

function TRttiFieldTypeIsSet.IsSatisfiedBy(const item: TRttiField): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fIsSet.IsSatisfiedBy(item.FieldType);
end;

{ TRttiFieldTypeIsPublicType }

constructor TRttiFieldTypeIsPublicType.Create;
begin
  fIsPublicType := TRttiTypeIsPublicType.Create;
end;

function TRttiFieldTypeIsPublicType.IsSatisfiedBy(const item: TRttiField): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fIsPublicType.IsSatisfiedBy(item.FieldType)
end;

{ TRttiFieldHasAttribute }

constructor TRttiFieldHasAttribute.Create(const ANameSpecification: ISpecification<String>);
begin
  fHasAttribute := TRttiMemberHasAttribute.Create(ANameSpecification);
end;

function TRttiFieldHasAttribute.IsSatisfiedBy(const item: TRttiField): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fHasAttribute.IsSatisfiedBy(item);
end;

{ TRttiFieldHasAttributeType<T> }

constructor TRttiFieldHasAttributeType<T>.Create;
begin
  fHasAttributeType := TRttiMemberHasAttributeType<T>.Create;
end;

function TRttiFieldHasAttributeType<T>.IsSatisfiedBy(const item: TRttiField): Boolean;
begin
  Result := fHasAttributeType.IsSatisfiedBy(item);
end;

{ TRttiFieldHasAttributeType }

constructor TRttiFieldHasAttributeType.Create(const AValue: TAttributeClass);
begin
  fHasAttributeType := TRttiMemberHasAttributeType.Create(AValue);
end;

function TRttiFieldHasAttributeType.IsSatisfiedBy(const item: TRttiField): Boolean;
begin
  Result := fHasAttributeType.IsSatisfiedBy(item);
end;

{ TRttiFieldHasVisibility }

constructor TRttiFieldHasVisibility.Create(const AVisibilities: TMemberVisibilities);
begin
  fHasVisibilities := TRttiMemberHasVisibility.Create(AVisibilities);
end;

function TRttiFieldHasVisibility.IsSatisfiedBy(const item: TRttiField): Boolean;
begin
  Result := fHasVisibilities.IsSatisfiedBy(item);
end;

end.
