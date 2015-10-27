unit Delphi.SpecificationUtils.DateTime.Types;

interface

type
  TDayOfWeek = (
   UnknownDay,
   Monday,
   Tuesday,
   Wednesday,
   Thursday,
   Friday,
   Saturday,
   Sunday
  );
  
  TDaysOfWeek = set of TDayOfWeek;
  
  TMonth = (
   UnknownMonth,
   January,
   February,
   March,
   April,
   May,
   June,
   July,
   August,
   September,
   October,
   November,
   December
  );
  
  TMonths = set of TMonth;

  Month = record
  private
    fMonth: TMonth;
    fMonthAsInteger: Integer;
    fMonthAsString: String;

    class function IntegerToMonth(const AValue: Integer): TMonth; static;
    class function StringToMonth(const AValue: String): TMonth; static;
  public
    constructor Create(const AMonth: TMonth);
    constructor CreateFromDate(const AValue: TDateTime);
    constructor CreateFromInteger(const AValue: Integer);
    constructor CreateFromString(const AValue: String);

    function DaysInLeapYear: Integer;
    function DaysNotInLeapYear: Integer;

    function MonthAsEnum: TMonth;
    function MonthAsInteger: Integer;
    function MonthAsString: String;

    class operator Implicit(const value: TDateTime): Month;
    class operator Implicit(const value: Integer): Month;
    class operator Implicit(const value: String): Month;
    class operator Implicit(const value: TMonth): Month;

    class operator Implicit(const value: Month): TMonth;
    class operator Implicit(const value: Month): Integer;
    class operator Implicit(const value: Month): String;
  end;

  DayOfWeek = record
  private
    fDayOfWeek: TDayOfWeek;
    fDayAsInteger: Integer;
    fDayAsString: String;

    class function IntegerToDayOfWeek(const AValue: Integer): TDayOfWeek; static;
    class function StringToDayOfWeek(const AValue: String): TDayOfWeek; static;
  public
    constructor Create(const AValue: TDayOfWeek);
    constructor CreateFromDate(const AValue: TDateTime);
    constructor CreateFromInteger(const AValue: Integer);
    constructor CreateFromString(const AValue: String);

    function DayOfWeekEnum: TDayOfWeek;
    function DayOfWeekAsInteger: Integer;
    function DayOfWeekAsString: String;
    function Equals(const AValue: TDayOfWeek): boolean;

    class operator Implicit(const value: TDateTime): DayOfWeek;
    class operator Implicit(const value: Integer): DayOfWeek;
    class operator Implicit(const value: String): DayOfWeek;
    class operator Implicit(const value: TDayOfWeek): DayOfWeek;

    class operator Implicit(const value: DayOfWeek): TDayOfWeek;
    class operator Implicit(const value: DayOfWeek): Integer;
    class operator Implicit(const value: DayOfWeek): String;

    class operator Equal(const a, b: DayOfWeek) : Boolean;
    class operator NotEqual(const a, b: DayOfWeek) : Boolean;
  end;

implementation

uses
  System.DateUtils,
  Delphi.SpecificationUtils.Helper.Strings,
  System.SysUtils,
  Spring, Delphi.SpecificationUtils.Helper.Integer;

const
  TDayOfWeekToInteger: Array[TDayOfWeek] of Integer = (
    -1, // UnknownDay
    1, // Monday
    2, // Tuesday
    3, // Wednesday
    4, // Thursday
    5, // Friday
    6, // Saturday
    7  // Sunday
  );

  TDayOfWeekToString: Array[TDayOfWeek] of String =(
    'UnknownDay',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday');

  TMonthToInteger: Array[TMonth] of Integer = (
    -1, // UnknownMonth
    1, // January
    2, // February
    3, // March
    4, // April
    5, // May
    6, // June
    7, // July
    8, // August
    9, // September
    10, // October
    11, // November
    12  // December
    );
    
  TMonthToString: Array[TMonth] of string = ( 
    'UnknownMonth',
   'January',
   'February',
   'March',
   'April',
   'May',
   'June',
   'July',
   'August',
   'September',
   'October',
   'November',
   'December' );

  TMonthToDaysNotInLeapYear: Array[TMonth] of Integer = (
   -1, // UnknownMonth
   31, // January
   28, // February
   31, // March
   30, // April
   31, // May
   30, // June
   31, // July
   31, // August
   30, // September
   31, // October
   30, // November
   31  // December
   );
   
  TMonthToDaysInLeapYear: Array[TMonth] of Integer = (
   -1, // UnknownMonth
   31, // January
   29, // February
   31, // March
   30, // April
   31, // May
   30, // June
   31, // July
   31, // August
   30, // September
   31, // October
   30, // November
   31  // December
  );

{ Month }

constructor Month.Create(const AMonth: TMonth);
begin
  if AMonth = TMonth.UnknownMonth then
       Guard.RaiseArgumentNullException('UknownMonth is not a valid Month');

  fMonth := AMonth;
  fMonthAsInteger := TMonthToInteger[fMonth];
  fMonthAsString := TMonthToString[fMonth];
end;


constructor Month.CreateFromDate(const AValue: TDateTime);
begin
  CreateFromInteger(MonthOf(AValue));
end;

constructor Month.CreateFromInteger(const AValue: Integer);
begin
  Create(IntegerToMonth(AValue));
end;

constructor Month.CreateFromString(const AValue: String);
begin
  Create(StringToMonth(AValue));
end;

function Month.DaysInLeapYear: Integer;
begin
  Result := TMonthToDaysInLeapYear[fMonth];
end;

function Month.DaysNotInLeapYear: Integer;
begin
  Result := TMonthToDaysNotInLeapYear[fMonth];
end;

class operator Month.Implicit(const value: Integer): Month;
begin
  Result := Month.CreateFromInteger(value);
end;

class operator Month.Implicit(const value: String): Month;
begin
  Result := Month.CreateFromString(value);
end;

class operator Month.Implicit(const value: TMonth): Month;
begin
  Result := Month.Create(value);
end;

class operator Month.Implicit(const value: TDateTime): Month;
begin
  Result := Month.CreateFromDate(value);
end;

class operator Month.Implicit(const value: Month): Integer;
begin
  Result := value.MonthAsInteger;
end;

class operator Month.Implicit(const value: Month): TMonth;
begin
  Result := value.MonthAsEnum;
end;

class operator Month.Implicit(const value: Month): String;
begin
  Result := value.MonthAsString;
end;

class function Month.IntegerToMonth(const AValue: Integer): TMonth;
var
  LCurrent: TMonth;
begin
  Result := TMonth.UnknownMonth;
  for LCurrent := Low(TMonth) to High(TMonth) do
    if TMonthToInteger[LCurrent].Equals(AValue) then
      Exit(LCurrent);
end;

function Month.MonthAsEnum: TMonth;
begin
  Result := fMonth;
end;

function Month.MonthAsInteger: Integer;
begin
  Result := fMonthAsInteger;
end;

function Month.MonthAsString: String;
begin
  Result := fMonthAsString;
end;

class function Month.StringToMonth(const AValue: String): TMonth;
var
  LCurrent: TMonth;
begin
  Result := TMonth.UnknownMonth;
  for LCurrent := Low(TMonth) to High(TMonth) do
    if TMonthToString[LCurrent].Equals(AValue) then
      Exit(LCurrent);
end;
{ DayOfWeek }

constructor DayOfWeek.Create(const AValue: TDayOfWeek);
begin
  if AValue = TDayOfWeek.UnknownDay then
    Guard.RaiseArgumentNullException('UknownDay is not a valid DayOfWeek');
  
  fDayOfWeek := AValue;
  fDayAsInteger := TDayOfWeekToInteger[fDayOfWeek];
  fDayAsString := TDayOfWeekToString[fDayOfWeek];
end;

constructor DayOfWeek.CreateFromDate(const AValue: TDateTime);
begin
  Create(DayOfWeek(AValue));
end;

constructor DayOfWeek.CreateFromInteger(const AValue: Integer);
begin
  Create(IntegerToDayOfWeek(AValue));
end;

constructor DayOfWeek.CreateFromString(const AValue: String);
begin
  Create(StringToDayOfWeek(AValue));
end;

function DayOfWeek.DayOfWeekEnum: TDayOfWeek;
begin
  Result := fDayOfWeek;
end;

class operator DayOfWeek.Equal(const a, b: DayOfWeek): Boolean;
begin
  Result := a.Equals(b);
end;

function DayOfWeek.Equals(const AValue: TDayOfWeek): boolean;
begin
  Result := fDayOfWeek = AValue;
end;

function DayOfWeek.DayOfWeekAsInteger: Integer;
begin
  Result := fDayAsInteger;
end;

function DayOfWeek.DayOfWeekAsString: String;
begin
  Result := fDayAsString;
end;

class operator DayOfWeek.Implicit(const value: TDateTime): DayOfWeek;
begin
  Result := DayOfWeek.CreateFromDate(value);
end;

class operator DayOfWeek.Implicit(const value: Integer): DayOfWeek;
begin
  Result := DayOfWeek.CreateFromInteger(value);
end;

class operator DayOfWeek.Implicit(const value: String): DayOfWeek;
begin
  Result := DayOfWeek.CreateFromString(value);
end;

class operator DayOfWeek.Implicit(const value: TDayOfWeek): DayOfWeek;
begin
  Result := DayOfWeek.Create(value);
end;

class operator DayOfWeek.Implicit(const value: DayOfWeek): TDayOfWeek;
begin
  Result := Value.DayOfWeekEnum;
end;

class operator DayOfWeek.Implicit(const value: DayOfWeek): Integer;
begin
  Result := Value.fDayAsInteger;
end;

class operator DayOfWeek.Implicit(const value: DayOfWeek): String;
begin
  Result := Value.DayOfWeekAsString;
end;

class function DayOfWeek.IntegerToDayOfWeek(const AValue: Integer): TDayOfWeek;
var
  LCurrent: TDayOfWeek;
begin
  Result := TDayOfWeek.UnknownDay;
  for LCurrent := Low(TDayOfWeek) to High(TDayOfWeek) do
    if TDayOfWeekToInteger[LCurrent].Equals(AValue) then
      Exit(LCurrent);
end;

class operator DayOfWeek.NotEqual(const a, b: DayOfWeek): Boolean;
begin
  Result := not a.Equals(b)
end;

class function DayOfWeek.StringToDayOfWeek(const AValue: String): TDayOfWeek;
var
  LCurrent: TDayOfWeek;
begin
  Result := TDayOfWeek.UnknownDay;
  for LCurrent := Low(TDayOfWeek) to High(TDayOfWeek) do
    if TDayOfWeekToString[LCurrent].Equals(AValue) then
      Exit(LCurrent);
end;

end.
