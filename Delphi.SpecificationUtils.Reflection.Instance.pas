unit Delphi.SpecificationUtils.Reflection.Instance;

interface

uses
  Spring.DesignPatterns,
  System.Rtti,
  Spring,
  System.SysUtils;

type
  TObjectHasMember = class(TSpecificationBase<TObject>)
  protected
    fNameSpecification: ISpecification<String>;
    fHasMember: ISpecification<TRttiType>;
  public
    constructor Create(const ANameSpecification: ISpecification<String>);
    function IsSatisfiedBy(const item: TObject): Boolean; override;
  end;

  TObjectHasProperty = class(TSpecificationBase<TObject>)
  protected
    fNameSpecification: ISpecification<String>;
    fHasProperty: ISpecification<TRttiType>;
  public
    constructor Create(const ANameSpecification: ISpecification<String>);
    function IsSatisfiedBy(const item: TObject): Boolean; override;
  end;

  TObjectHasField = class(TSpecificationBase<TObject>)
  protected
    fNameSpecification: ISpecification<String>;
    fHasField: ISpecification<TRttiType>;
  public
    constructor Create(const ANameSpecification: ISpecification<String>);
    function IsSatisfiedBy(const item: TObject): Boolean; override;
  end;

  TObjectHasMethod = class(TSpecificationBase<TObject>)
  protected
    fNameSpecification: ISpecification<String>;
    fHasMethod: ISpecification<TRttiType>;
  public
    constructor Create(const ANameSpecification: ISpecification<String>);
    function IsSatisfiedBy(const item: TObject): Boolean; override;
  end;

  TObjectHasAttribute = class(TSpecificationBase<TObject>)
  protected
    fNameSpecification: ISpecification<String>;
    fHasAttribute: ISpecification<TRttiType>;
  public
    constructor Create(const ANameSpecification: ISpecification<String>);
    function IsSatisfiedBy(const item: TObject): Boolean; override;
  end;

  TObjectHasAttributeType = class(TSpecificationBase<TObject>)
  protected
    fHasAttributeType: ISpecification<TRttiType>;
  public
    constructor Create(const AValue: TAttributeClass);
    function IsSatisfiedBy(const item: TObject): Boolean; override;
  end;

  TObjectHasAttributeType<T: TCustomAttribute> = class(TSpecificationBase<TObject>)
  protected
    fHasAttributeType: ISpecification<TRttiType>;
  public
    constructor Create;
    function IsSatisfiedBy(const item: TObject): Boolean; override;
  end;

  TObjectInheritsFrom = class(TSpecificationBase<TObject>)
  protected
    fClass: TClass;
  public
    constructor Create(const AValue: TClass);
    function IsSatisfiedBy(const item: TObject): Boolean; override;
  end;

  TObjectInheritsFromByName = class(TSpecificationBase<TObject>)
  protected
    fClassHasName: ISpecification<TClass>;
  public
    constructor Create(const ANameSpecification: ISpecification<String>);
    function IsSatisfiedBy(const item: TObject): Boolean; override;
  end;

  TObjectImplementsByName = class(TSpecificationBase<TObject>)
  protected
    fImplements: ISpecification<TRttiInstanceType>;
  public
    constructor Create(const ANameSpecification: ISpecification<String>);
    function IsSatisfiedBy(const item: TObject): Boolean; override;
  end;

  TInterfacedObjectImplementsByName = class(TSpecificationBase<IInterface>)
  protected
    fImplements: ISpecification<TObject>;
  public
    constructor Create(const ANameSpecification: ISpecification<String>);
    function IsSatisfiedBy(const item: IInterface): Boolean; override;
  end;

implementation

uses
  Delphi.SpecificationUtils.Helper.TObject,
  Delphi.SpecificationUtils.Reflection.TRttiType,
  Delphi.SpecificationUtils.Reflection.TClass,
  Delphi.SpecificationUtils.Reflection.TRttiInstanceType;

{ TObjectHasProperty }

constructor TObjectHasProperty.Create(const ANameSpecification: ISpecification<String>);
begin
  Guard.CheckNotNull(ANameSpecification, 'missing Namespecification');
  fNameSpecification := ANameSpecification;
  fHasProperty := TRttiTypeHasProperty.Create(fNameSpecification);
end;

function TObjectHasProperty.IsSatisfiedBy(const item: TObject): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fHasProperty.IsSatisfiedBy(item.GetType);
end;

{ TObjectHasMember }

constructor TObjectHasMember.Create(const ANameSpecification: ISpecification<String>);
begin
  Guard.CheckNotNull(ANameSpecification, 'missing Specification');
  fNameSpecification := ANameSpecification;
  fHasMember := TRttiTypeHasMember.Create(fNameSpecification);
end;

function TObjectHasMember.IsSatisfiedBy(const item: TObject): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fHasMember.IsSatisfiedBy(item.GetType);
end;

{ TObjectHasField }

constructor TObjectHasField.Create(const ANameSpecification: ISpecification<String>);
begin
  Guard.CheckNotNull(ANameSpecification, 'missing Specification');
  fNameSpecification := ANameSpecification;
  fHasField := TRttiTypeHasField.Create(fNameSpecification);
end;

function TObjectHasField.IsSatisfiedBy(const item: TObject): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fHasField.IsSatisfiedBy(item.GetType);
end;

{ TObjectHasMethod }

constructor TObjectHasMethod.Create(const ANameSpecification: ISpecification<String>);
begin
  Guard.CheckNotNull(ANameSpecification, 'missing Specification');
  fNameSpecification := ANameSpecification;
  fHasMethod := TRttiTypeHasMethod.Create(fNameSpecification);
end;

function TObjectHasMethod.IsSatisfiedBy(const item: TObject): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fHasMethod.IsSatisfiedBy(item.GetType);
end;

{ TObjectHasAttribute }

constructor TObjectHasAttribute.Create(const ANameSpecification: ISpecification<String>);
begin
  Guard.CheckNotNull(ANameSpecification, 'missing Specification');
  fNameSpecification := ANameSpecification;
  fHasAttribute := TRttiTypeHasAttribute.Create(fNameSpecification);
end;

function TObjectHasAttribute.IsSatisfiedBy(const item: TObject): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fHasAttribute.IsSatisfiedBy(item.GetType);
end;

{ TObjectHasAttributeType<T> }

constructor TObjectHasAttributeType<T>.Create;
begin
  fHasAttributeType := TRttiTypeHasAttributeType<T>.Create;
end;

function TObjectHasAttributeType<T>.IsSatisfiedBy(const item: TObject): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fHasAttributeType.IsSatisfiedBy(item.GetType);
end;

{ TObjectHasAttributeType }

constructor TObjectHasAttributeType.Create(const AValue: TAttributeClass);
begin
  fHasAttributeType := TRttiTypeHasAttributeType.Create(AValue);
end;

function TObjectHasAttributeType.IsSatisfiedBy(const item: TObject): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fHasAttributeType.IsSatisfiedBy(item.GetType);
end;

{ TObjectInheritsFrom }

constructor TObjectInheritsFrom.Create(const AValue: TClass);
begin
  fClass := AValue;
end;

function TObjectInheritsFrom.IsSatisfiedBy(const item: TObject): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := item is fClass;
end;

{ TObjectInheritsFromByName }

constructor TObjectInheritsFromByName.Create(const ANameSpecification: ISpecification<String>);
begin
  Guard.CheckNotNull(ANameSpecification, 'missing Specification');
  fClassHasName := TClassHasName.Create(ANameSpecification);
end;

function TObjectInheritsFromByName.IsSatisfiedBy(const item: TObject): Boolean;
var
  LDescendant: TClass;
begin
  Guard.CheckNotNull(item, 'missing item');

  Result := false;
  LDescendant := item.ClassParent;
  while Assigned(LDescendant) do
  begin
    if fClassHasName.IsSatisfiedBy(LDescendant) then
      Exit(true);
    LDescendant := LDescendant.ClassParent;
  end;
end;

{ TObjectImplementsByName }

constructor TObjectImplementsByName.Create(const ANameSpecification: ISpecification<String>);
begin
  Guard.CheckNotNull(ANameSpecification, 'missing Specification');
  fImplements := TRttiInstanceTypeImplementsByName.Create(ANameSpecification);
end;

function TObjectImplementsByName.IsSatisfiedBy(const item: TObject): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fImplements.IsSatisfiedBy(TRttiInstanceType(item.GetType));
end;

{ TInterfacedObjectImplementsByName }

constructor TInterfacedObjectImplementsByName.Create(const ANameSpecification: ISpecification<String>);
begin
  Guard.CheckNotNull(ANameSpecification, 'missing Specification');
  fImplements := TObjectImplementsByName.Create(ANameSpecification);
end;

function TInterfacedObjectImplementsByName.IsSatisfiedBy(const item: IInterface): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := fImplements.IsSatisfiedBy(item AS TObject);
end;

end.
