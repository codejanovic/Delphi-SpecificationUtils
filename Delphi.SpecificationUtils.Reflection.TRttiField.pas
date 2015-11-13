unit Delphi.SpecificationUtils.Reflection.TRttiField;

interface

uses
  Spring.DesignPatterns,
  System.Rtti,
  Spring;

type
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


implementation

uses
  Delphi.SpecificationUtils.Reflection.TRttiType;


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


end.
