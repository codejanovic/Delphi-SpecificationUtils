unit Delphi.SpecificationUtils.Reflection.TRttiMember;

interface

uses
  Spring.DesignPatterns,
  System.Rtti,
  Spring,
  System.TypInfo,
  Delphi.SpecificationUtils;

type
  TRttiMemberHasAttribute = class(TSpecificationBase<TRttiMember>)
  protected
    fNameSpecification: ISpecification<String>;
  public
    constructor Create(const ANameSpecification: ISpecification<String>);
    function IsSatisfiedBy(const item: TRttiMember): Boolean; override;
  end;

  TRttiMemberHasAttributeType<T: TCustomAttribute> = class(TSpecificationBase<TRttiMember>)
  public
    function IsSatisfiedBy(const item: TRttiMember): Boolean; override;
  end;

  TRttiMemberHasAttributeType = class(TSpecificationBase<TRttiMember>)
  protected
    fClass: TClass;
  public
    constructor Create(const AValue: TClass);
    function IsSatisfiedBy(const item: TRttiMember): Boolean; override;
  end;

  TRttiMemberHasVisibility = class(TSpecificationBase<TRttiMember>)
  protected
    fVisibilities: TMemberVisibilities;
  public
    constructor Create(const AVisibilities: TMemberVisibilities);
    function IsSatisfiedBy(const item: TRttiMember): Boolean; override;
  end;

implementation

uses
  DSharp.Core.Reflection,
  Delphi.SpecificationUtils.Helper.Strings;

{ TRttiMemberHasVisibility }

constructor TRttiMemberHasVisibility.Create(const AVisibilities: TMemberVisibilities);
begin
  fVisibilities := AVisibilities;
end;

function TRttiMemberHasVisibility.IsSatisfiedBy(const item: TRttiMember): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := item.Visibility in fVisibilities;
end;

{ TRttiMemberHasAttributeType<T> }

function TRttiMemberHasAttributeType<T>.IsSatisfiedBy(const item: TRttiMember): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := item.IsDefined<T>;
end;

{ TRttiMemberHasAttribute }

constructor TRttiMemberHasAttribute.Create(const ANameSpecification: ISpecification<String>);
begin
  Guard.CheckNotNull(ANameSpecification, 'missing Namespecification');
  fNameSpecification := ANameSpecification;
end;

function TRttiMemberHasAttribute.IsSatisfiedBy(const item: TRttiMember): Boolean;
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

{ TRttiMemberHasAttributeType }

constructor TRttiMemberHasAttributeType.Create(const AValue: TClass);
begin
  fClass := AValue;
end;

function TRttiMemberHasAttributeType.IsSatisfiedBy(const item: TRttiMember): Boolean;
begin
  Guard.CheckNotNull(item, 'missing item');
  Result := Length(item.GetCustomAttributes(fClass)) > 0;
end;

end.
