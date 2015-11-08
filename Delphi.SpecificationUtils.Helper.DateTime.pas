unit Delphi.SpecificationUtils.Helper.DateTime;

interface

uses
  System.SysUtils,
  Delphi.SpecificationUtils.DateTime.Types;

type
  TSpecificationDateTimeHelper = record helper for TDateTime
  public
    class function Now: TDateTime; static;
    class function Tomorrow: TDateTime; static;
    class function Yesterday: TDateTime; static;

    function ToString(const AFormatSettings: TFormatSettings): String;
    function ToStringAsDate: String;
    function ToStringAsDateTime: String;
    function ToDouble: Double;

    function IsToday: Boolean;
    function IsTomorrow: Boolean;
    function IsYesterday: Boolean;
    function IsPM: Boolean;
    function IsAM: boolean;
    function IsLeapYear: boolean;

    function DayOfWeek: TDayOfWeek;
    function MonthOfYear: TMonth;

    function Day: Integer;
    function Month: Integer;
    function Year: Integer;
    function Hour: Integer;
    function Minute: Integer;
    function Second: Integer;

    function IncreaseDay: TDateTime; overload;
    function IncreaseDay(const ANumber: Integer): TDateTime; overload;
    function IncreaseMonth: TDateTime; overload;
    function IncreaseMonth(const ANumber: Integer): TDateTime; overload;
    function IncreaseYear: TDateTime; overload;
    function IncreaseYear(const ANumber: Integer): TDateTime; overload;
    function IncreaseHour: TDateTime; overload;
    function IncreaseHour(const ANumber: Integer): TDateTime; overload;
    function IncreaseMinute: TDateTime; overload;
    function IncreaseMinute(const ANumber: Integer): TDateTime; overload;
    function IncreaseSecond: TDateTime; overload;
    function IncreaseSecond(const ANumber: Integer): TDateTime; overload;

  end;

implementation

uses
  System.DateUtils,
  Delphi.SpecificationUtils.DateTime;

{ TSpecificationDateTimeHelper }

function TSpecificationDateTimeHelper.Day: Integer;
begin
  Result := System.DateUtils.DayOf(Self);
end;

function TSpecificationDateTimeHelper.DayOfWeek: TDayOfWeek;
var
  LDayOfWeek: Delphi.SpecificationUtils.DateTime.Types.DayOfWeek;
begin
  LDayOfWeek.CreateFromDate(Self);
  Result := LDayOfWeek.ToEnum;
end;


function TSpecificationDateTimeHelper.Hour: Integer;
begin
  Result := System.DateUtils.HourOf(Self);
end;

function TSpecificationDateTimeHelper.IncreaseDay: TDateTime;
begin
  Result := System.DateUtils.IncDay(Self);
end;

function TSpecificationDateTimeHelper.IncreaseDay(const ANumber: Integer): TDateTime;
begin
  Result := System.DateUtils.IncDay(Self, ANumber);
end;

function TSpecificationDateTimeHelper.IncreaseHour(const ANumber: Integer): TDateTime;
begin
  Result := System.DateUtils.IncHour(Self, ANumber);
end;

function TSpecificationDateTimeHelper.IncreaseHour: TDateTime;
begin
  Result := System.DateUtils.IncHour(Self);
end;

function TSpecificationDateTimeHelper.IncreaseMinute(const ANumber: Integer): TDateTime;
begin
  Result := System.DateUtils.IncMinute(Self, ANumber);
end;

function TSpecificationDateTimeHelper.IncreaseMinute: TDateTime;
begin
  Result := System.DateUtils.IncMinute(Self);
end;

function TSpecificationDateTimeHelper.IncreaseMonth: TDateTime;
begin
  Result := System.SysUtils.IncMonth(Self);
end;

function TSpecificationDateTimeHelper.IncreaseMonth(const ANumber: Integer): TDateTime;
begin
  Result := System.SysUtils.IncMonth(Self, ANumber);
end;

function TSpecificationDateTimeHelper.IncreaseSecond: TDateTime;
begin
  Result := System.DateUtils.IncSecond(Self);
end;

function TSpecificationDateTimeHelper.IncreaseSecond(const ANumber: Integer): TDateTime;
begin
  Result := System.DateUtils.IncSecond(Self, ANumber);
end;

function TSpecificationDateTimeHelper.IncreaseYear: TDateTime;
begin
  Result := System.DateUtils.IncYear(Self);
end;

function TSpecificationDateTimeHelper.IncreaseYear(const ANumber: Integer): TDateTime;
begin
  Result := System.DateUtils.IncYear(Self, ANumber);
end;

function TSpecificationDateTimeHelper.IsAM: boolean;
begin
  Result := System.DateUtils.IsAM(Self);
end;

function TSpecificationDateTimeHelper.IsLeapYear: boolean;
begin
  Result := TDateTimeIsLeapYear.Create.IsSatisfiedBy(Self);
end;

function TSpecificationDateTimeHelper.IsPM: Boolean;
begin
  Result := System.DateUtils.IsPM(Self);
end;

function TSpecificationDateTimeHelper.IsToday: Boolean;
begin
  Result := TDateTimeIsToday.Create.IsSatisfiedBy(Self);
end;

function TSpecificationDateTimeHelper.IsTomorrow: Boolean;
begin
  Result := TDateTimeIsTomorrow.Create.IsSatisfiedBy(Self);
end;

function TSpecificationDateTimeHelper.IsYesterday: Boolean;
begin
  Result := TDateTimeIsYesterday.Create.IsSatisfiedBy(Self);
end;

function TSpecificationDateTimeHelper.Minute: Integer;
begin
  Result := System.DateUtils.MinuteOf(Self);
end;

function TSpecificationDateTimeHelper.Month: Integer;
begin
  Result := System.DateUtils.MonthOf(Self);
end;

function TSpecificationDateTimeHelper.MonthOfYear: TMonth;
var
  LMonth: Delphi.SpecificationUtils.DateTime.Types.Month;
begin
  LMonth.CreateFromInteger(Self.Month);
  Result := LMonth.ToEnum;
end;

class function TSpecificationDateTimeHelper.Now: TDateTime;
begin
  Result := System.SysUtils.Now;
end;

class function TSpecificationDateTimeHelper.Tomorrow: TDateTime;
begin
  Result := System.DateUtils.Tomorrow;
end;

function TSpecificationDateTimeHelper.Year: Integer;
begin
  Result := System.DateUtils.YearOf(Self);
end;

class function TSpecificationDateTimeHelper.Yesterday: TDateTime;
begin
  Result := System.DateUtils.Yesterday;
end;

function TSpecificationDateTimeHelper.Second: Integer;
begin
  Result := System.DateUtils.SecondOf(Self);
end;

function TSpecificationDateTimeHelper.ToDouble: Double;
begin
  Result := Self;
end;

function TSpecificationDateTimeHelper.ToString(const AFormatSettings: TFormatSettings): String;
begin
  Result := System.SysUtils.DateTimeToStr(Self, AFormatSettings);
end;

function TSpecificationDateTimeHelper.ToStringAsDate: String;
begin
  Result := System.SysUtils.DateToStr(Self);
end;

function TSpecificationDateTimeHelper.ToStringAsDateTime: String;
begin
  Result := System.SysUtils.DateTimeToStr(Self);
end;

end.
