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
  end;

  IGUIDSpecifications = interface(IInvokable)
    ['{7D0C44E6-CF24-4B09-BA8D-2F642F5853EA}']
    function Equals(const AValue: TGUID): TSpecification<TGUID>;
  end;

implementation

end.
