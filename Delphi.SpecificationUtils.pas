unit Delphi.SpecificationUtils;

interface

uses
  Spring.DesignPatterns,
  System.Generics.Defaults,
  System.RegularExpressions;

type
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
