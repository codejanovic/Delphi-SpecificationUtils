unit Delphi.SpecificationUtils.DateTime.Factory;

interface

uses
  Delphi.SpecificationUtils,
  Spring.DesignPatterns;

type
  TDateTimeSpecificationsFactory = class(TInterfacedObject, IDateTimeSpecifications)
  public
    function IsTomorrow: TSpecification<TDateTime>;
    function IsYesterday: TSpecification<TDateTime>;

    function EqualsDay(const ADay: Integer): TSpecification<TDateTime>;
    function EqualsMonth(const AMonth: Integer): TSpecification<TDateTime>;
    function EqualsYear(const AYear: Integer): TSpecification<TDateTime>;
    function EqualsMinute(const AMinute: Integer): TSpecification<TDateTime>;
    function EqualsSecond(const ASecond: Integer): TSpecification<TDateTime>;
    function EqualsHour(const AHour: Integer): TSpecification<TDateTime>;
  end;
implementation

uses
  Delphi.SpecificationUtils.DateTime;

{ TDateTimeSpecificationsFactory }

function TDateTimeSpecificationsFactory.EqualsDay(const ADay: Integer): TSpecification<TDateTime>;
begin
  Result := TDateTimeEqualsDay.Create(ADay);
end;

function TDateTimeSpecificationsFactory.EqualsHour(const AHour: Integer): TSpecification<TDateTime>;
begin
  Result := TDateTimeEqualsHour.Create(AHour);
end;

function TDateTimeSpecificationsFactory.EqualsMinute(const AMinute: Integer): TSpecification<TDateTime>;
begin
  Result := TDateTimeEqualsMinute.Create(AMinute);
end;

function TDateTimeSpecificationsFactory.EqualsMonth(const AMonth: Integer): TSpecification<TDateTime>;
begin
  Result := TDateTimeEqualsMonth.Create(AMonth);
end;

function TDateTimeSpecificationsFactory.EqualsSecond(const ASecond: Integer): TSpecification<TDateTime>;
begin
  Result := TDateTimeEqualsSecond.Create(ASecond);
end;

function TDateTimeSpecificationsFactory.EqualsYear(const AYear: Integer): TSpecification<TDateTime>;
begin
  Result := TDateTimeEqualsYear.Create(AYear);
end;

function TDateTimeSpecificationsFactory.IsTomorrow: TSpecification<TDateTime>;
begin
  Result := TDateTimeIsTomorrow.Create();
end;

function TDateTimeSpecificationsFactory.IsYesterday: TSpecification<TDateTime>;
begin
  Result := TDateTimeIsYesterday.Create();
end;

end.
