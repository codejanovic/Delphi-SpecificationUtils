unit Delphi.SpecificationUtils;

interface

uses
  Spring.DesignPatterns,
  System.Generics.Defaults,
  System.RegularExpressions,
  System.TypInfo,
  System.Rtti;

type
  TTypeKinds = set of TTypeKind;
  TMemberVisibilities = set of TMemberVisibility;

  IArraySpecifications<T> = interface(IInvokable)
    ['{8864FF19-49D6-46A3-92CF-989E8408BEA6}']
    function HasLength(const ALength: Integer): TSpecification<TArray<T>>;
    function IsEmpty: TSpecification<TArray<T>>;
    function EqualsInSequence(const AArray: TArray<T>; const AValue: IEqualityComparer<T>): TSpecification<TArray<T>>;
    function Equals(const AArray: TArray<T>; const AValue: IEqualityComparer<T>): TSpecification<TArray<T>>;
    function EqualsInLength(const AArray: TArray<T>): TSpecification<TArray<T>>;
    function Contains(const AItem: T; const AValue: IEqualityComparer<T>): TSpecification<TArray<T>>;
    function ContainsAny(const AItems: TArray<T>; const AValue: IEqualityComparer<T>): TSpecification<TArray<T>>;
  end;

  IDateTimeSpecifications = interface(IInvokable)
    ['{C58C538E-876B-4945-AE02-8E298C8663D0}']
    function IsTomorrow: TSpecification<TDateTime>;
    function IsYesterday: TSpecification<TDateTime>;
	
    function EqualsDay(const ADay: Integer): TSpecification<TDateTime>;
    function EqualsMonth(const AMonth: Integer): TSpecification<TDateTime>;
    function EqualsYear(const AYear: Integer): TSpecification<TDateTime>;
    function EqualsMinute(const AMinute: Integer): TSpecification<TDateTime>;
    function EqualsSecond(const ASecond: Integer): TSpecification<TDateTime>;
    function EqualsHour(const AHour: Integer): TSpecification<TDateTime>;
  end;

  IStringSpecifications = interface(IInvokable)
    ['{65BA3B07-3BA0-461F-92B5-D139EB1E22CE}']
    function HasLength(const ALength: Integer): TSpecification<String>;
    function HasLengthGreatherThan(const AMinLength: Integer): TSpecification<String>;
    function HasLengthLessThan(const AMaxLength: Integer): TSpecification<String>;
    function IsBoolean: TSpecification<String>;
    function MatchesRegex(const AExpression: String; const AOptions: TRegExOptions): TSpecification<String>;
    function IsInteger: TSpecification<String>;
    function IsFloat: TSpecification<String>;
    function IsGUID: TSpecification<String>;

    function ContainsAny(const ASubStrings: TArray<String>): TSpecification<String>;
    function EqualsAny(const AValues: TArray<String>): TSpecification<String>;
    function Contains(const ASubString: String): TSpecification<String>;
    function Equals(const AValue: String): TSpecification<String>;
    function StartsWith(const ASubString: String): TSpecification<String>;
    function StartsWithAny(const ASubStrings: TArray<String>): TSpecification<String>;
    function EndsWithAny(const ASubStrings: TArray<String>): TSpecification<String>;
    function EndsWith(const ASubString: String): TSpecification<String>;

    function ContainsIgnoreCase(const ASubString: String): TSpecification<String>;
    function EqualsIgnoreCase(const AValue: String): TSpecification<String>;
    function ContainsAnyIgnoreCase(const ASubStrings: TArray<string>): TSpecification<String>;
    function EqualsAnyIgnoreCase(const AValues: TArray<String>): TSpecification<String>;
    function StartsWithIgnoreCase(const ASubString: String): TSpecification<String>;
    function StartsWithAnyIgnoreCase(const ASubStrings: TArray<String>): TSpecification<String>;
    function EndsWithAnyIgnoreCase(const ASubStrings: TArray<String>): TSpecification<String>;
    function EndsWithIgnoreCase(const ASubString: String): TSpecification<String>;
  end;

  IGUIDSpecifications = interface(IInvokable)
    ['{7D0C44E6-CF24-4B09-BA8D-2F642F5853EA}']
    function Equals(const AValue: TGUID): TSpecification<TGUID>;
  end;

  IReflectionObjectSpecifications = interface(IInvokable)
    ['{00D25B87-612B-4D74-80E1-F1BA552EE0FA}']
    function HasMemberThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
    function HasPropertyThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
    function HasFieldThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
    function HasMethodThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
    function HasAttributeThatSatisfied(const ANameSpecification: ISpecification<String>): TSpecification<TObject>;
    function HasAttributeType(const AClassOfAttribute: TClass): TSpecification<TObject>;
  end;

  IReflectionRttiTypeSpecifications = interface(IInvokable)
    ['{E74117C0-1F38-4CC6-804F-3B5AB57A8143}']
    function HasMemberThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiType>;
    function HasPropertyThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiType>;
    function HasFieldThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiType>;
    function HasMethodThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiType>;
    function HasAttributeThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiType>;    
    function HasAttributeType(const AClassOfAttribute: TClass): TSpecification<TRttiType>;    
    function IsManaged: TSpecification<TRttiType>;
    function IsInstance: TSpecification<TRttiType>;
    function IsOrdinal: TSpecification<TRttiType>;
    function IsRecord: TSpecification<TRttiType>;
    function IsSet: TSpecification<TRttiType>;
    function IsPublicType: TSpecification<TRttiType>;
    function IsInstanceType: TSpecification<TRttiType>;
  end;

  IReflectionRttiMemberSpecifications = interface(IInvokable)
    ['{82C2C346-D5ED-4A4D-B985-34F944DBE9F4}']
    function HasAttributeThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiMember>;    
    function HasAttributeType(const AClassOfAttribute: TClass): TSpecification<TRttiMember>;
    function HasVisibility(const AVisibilities: TMemberVisibilities): TSpecification<TRttiMember>;
  end;

  IReflectionRttiPropertySpecifications = interface(IInvokable)
    ['{A175C25A-42AF-47F3-8437-4A41932DA5C5}']
    function IsInstanceType: TSpecification<TRttiProperty>;
    function IsManaged: TSpecification<TRttiProperty>;
    function IsInstance: TSpecification<TRttiProperty>;
    function IsOrdinal: TSpecification<TRttiProperty>;
    function IsRecord: TSpecification<TRttiProperty>;
    function IsSet: TSpecification<TRttiProperty>;
    function IsPublicType: TSpecification<TRttiProperty>;
  end;

  IReflectionRttiFieldSpecifications = interface(IInvokable)
    ['{9E332918-D96E-49E3-B561-6A5A38AC4701}']
    function IsManaged: TSpecification<TRttiField>;
    function IsInstance: TSpecification<TRttiField>;
    function IsOrdinal: TSpecification<TRttiField>;
    function IsRecord: TSpecification<TRttiField>;
    function IsSet: TSpecification<TRttiField>;
    function IsPublicType: TSpecification<TRttiField>;
  end;

  IReflectionRttiNamedObjectSpecifications = interface(IInvokable)
    ['{8E18D6DA-210B-4B5D-AB1B-8A76F666F7BF}']
   function HasNameThatSatisfies(const ANameSpecification: ISpecification<String>): TSpecification<TRttiNamedObject>;
  end;

  IReflectionRttiValueSpecifications = interface(IInvokable)
    ['{37343842-10A4-49DD-820E-68432DD0AE62}']
    function IsOfTypeKind(const AValue: TTypeKinds): TSpecification<TValue>;
    function IsEmpty: TSpecification<TValue>;
    function IsObject: TSpecification<TValue>;
    function IsClass: TSpecification<TValue>;
    function IsOrdinal: TSpecification<TValue>;
    function IsArray: TSpecification<TValue>;
    function IsType(const AValue: PTypeInfo): TSpecification<TValue>;
    function IsInstanceOf(const AValue: TClass): TSpecification<TValue>;
  end;

  IReflectionSpecifications = interface(IInvokable)
    ['{330B3931-8DF7-4301-840F-C5DA9C49DE88}']
    function Objects: IReflectionObjectSpecifications;
    function RttiType: IReflectionRttiTypeSpecifications;
    function RttiMember: IReflectionRttiMemberSpecifications;
    function RttiProperty: IReflectionRttiPropertySpecifications;
    function RttiField: IReflectionRttiFieldSpecifications;
    function RttiNamedObject: IReflectionRttiNamedObjectSpecifications;
    function RttiValue: IReflectionRttiValueSpecifications   ;
  end;

  TSpecificationUtils = class
  public
    class function ArraySpecifications<T>: IArraySpecifications<T>;   
    class function DateTimeSpecifications: IDateTimeSpecifications;
    class function StringSpecifications: IStringSpecifications;
    class function GUIDSpecifications: IGUIDSpecifications;
  end;

implementation

uses
  Delphi.SpecificationUtils.Arrays.Factory,
  Delphi.SpecificationUtils.Strings.Factory,
  Delphi.SpecificationUtils.TGUID.Factory,
  Delphi.SpecificationUtils.DateTime.Factory;

{ TSpecificationUtils }

class function TSpecificationUtils.DateTimeSpecifications: IDateTimeSpecifications;
begin
  Result := TDateTimeSpecificationsFactory.Create;
end;

class function TSpecificationUtils.GUIDSpecifications: IGUIDSpecifications;
begin
  Result := TGUIDSpecificationsFactory.Create;
end;

class function TSpecificationUtils.StringSpecifications: IStringSpecifications;
begin
  Result := TStringSpecificationsFactory.Create;
end;

class function TSpecificationUtils.ArraySpecifications<T>: IArraySpecifications<T>;
begin
  Result := TArraySpecificationsFactory<T>.Create;
end;

end.
