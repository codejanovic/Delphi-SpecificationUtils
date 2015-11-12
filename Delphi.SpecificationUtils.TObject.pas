unit Delphi.SpecificationUtils.TObject;

interface

uses
  Spring.DesignPatterns,
  System.Rtti,
  Spring;

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

  TObjectHasAttributeType<T: TCustomAttribute> = class(TSpecificationBase<TObject>)
  protected
    fHasAttributeType: ISpecification<TRttiType>;
  public
    constructor Create;
    function IsSatisfiedBy(const item: TObject): Boolean; override;
  end;


implementation

uses
  DSharp.Core.Reflection,
  Delphi.SpecificationUtils.TRttiType;

{ TObjectHasProperty }

constructor TObjectHasProperty.Create(const ANameSpecification: ISpecification<String>);
begin
  Guard.CheckNotNull(ANameSpecification, 'missing Namespecification');
  fNameSpecification := ANameSpecification;
  fHasProperty := TRttiTypeHasProperty.Create(fNameSpecification);
end;

function TObjectHasProperty.IsSatisfiedBy(const item: TObject): Boolean;
begin
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
  Result := fHasAttribute.IsSatisfiedBy(item.GetType);
end;

{ TObjectHasAttributeType<T> }

constructor TObjectHasAttributeType<T>.Create;
begin
  fHasAttributeType := TRttiTypeHasAttributeType<T>.Create;
end;

function TObjectHasAttributeType<T>.IsSatisfiedBy(const item: TObject): Boolean;
begin
  Result := fHasAttributeType.IsSatisfiedBy(item.GetType);
end;

end.
