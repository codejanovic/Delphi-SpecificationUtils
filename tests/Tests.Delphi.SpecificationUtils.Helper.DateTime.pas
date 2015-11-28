unit Tests.Delphi.SpecificationUtils.Helper.DateTime;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  TTestTDateTimeHelper = class(TObject)
  protected
    function Now: TDateTime;
  public
    [Test]
    procedure TestNow;
    [Test]
    procedure TestTomorrow;
    [Test]
    procedure TestYesterday;

    [Test]
    procedure TestIsToday;
    [Test]
    procedure TestIsTomorrow;
    [Test]
    procedure TestIsYesterday;

    [TestCase('test1', '01.01.2015 23:59:59')]
    [TestCase('test2', '01.01.2015 12:00:00')]
    [TestCase('test3', '01.01.2015 13:00:00')]
    [TestCase('test4', '01.01.2015 18:00:00')]
    procedure TestIsPM(const ADate: String);

    [TestCase('test1', '01.01.2015 00:00:00')]
    [TestCase('test2', '01.01.2015 11:59:59')]
    [TestCase('test3', '01.01.2015 09:00:00')]
    procedure TestIsAM(const ADate: String);

    [TestCase('test1', '05.10.2015,Monday')]
    [TestCase('test2', '06.10.2015,Tuesday')]
    [TestCase('test3', '07.10.2015,Wednesday')]
    [TestCase('test4', '08.10.2015,Thursday')]
    [TestCase('test5', '09.10.2015,Friday')]
    [TestCase('test6', '10.10.2015,Saturday')]
    [TestCase('test7', '11.10.2015,Sunday')]
    procedure TestDayOfWeek(const ADate: String; const AExpectedDay: String);

    [TestCase('test1', '01.01.2015,January')]
    [TestCase('test2', '01.02.2015,February')]
    [TestCase('test3', '01.03.2015,March')]
    [TestCase('test4', '01.04.2015,April')]
    [TestCase('test5', '01.05.2015,May')]
    [TestCase('test6', '01.06.2015,June')]
    [TestCase('test7', '01.07.2015,July')]
    [TestCase('test8', '01.08.2015,August')]
    [TestCase('test9', '01.09.2015,September')]
    [TestCase('test10', '01.10.2015,October')]
    [TestCase('test11', '01.11.2015,November')]   
    [TestCase('test12', '01.12.2015,December')]   
    procedure TestMonthOfYear(const ADate: String; const AExpectedMonth: String);

    [TestCase('test1', '01.01.2015,1')]
    [TestCase('test2', '28.01.2015,28')]
    [TestCase('test3', '24.12.2015,24')]
    procedure TestDay(const ADate: String; const AExpectedDay: Integer);

    [TestCase('test1', '01.01.2015,1')]
    [TestCase('test2', '28.09.2015,9')]
    [TestCase('test3', '24.12.2015,12')]
    procedure TestMonth(const ADate: String; const AExpectedMonth: Integer);

    [TestCase('test1', '01.01.2012,2012')]
    [TestCase('test2', '28.09.2013,2013')]
    [TestCase('test3', '24.12.2014,2014')]
    procedure TestYear(const ADate: String; const AExpectedYear: Integer);

    [TestCase('test1', '01.01.2015 23:59:59,23')]
    [TestCase('test2', '01.01.2015 12:00:00,12')]
    [TestCase('test3', '01.01.2015 13:00:00,13')]
    [TestCase('test4', '01.01.2015 18:00:00,18')]
    procedure TestHour(const ADate: String; const AExpectedHour: Integer);

    [TestCase('test1', '01.01.2015 23:59:59,59')]
    [TestCase('test2', '01.01.2015 12:00:00,00')]
    [TestCase('test3', '01.01.2015 13:05:00,5')]
    [TestCase('test4', '01.01.2015 18:43:00,43')]
    procedure TestMinute(const ADate: String; const AExpectedMinute: Integer);

    [TestCase('test1', '01.01.2015 23:59:59,59')]
    [TestCase('test2', '01.01.2015 12:00:00,00')]
    [TestCase('test3', '01.01.2015 13:00:01,1')]
    [TestCase('test4', '01.01.2015 18:00:45,45')]
    procedure TestSecond(const ADate: String; const AExpectedSecond: Integer);

    [TestCase('test1', '01.01.2015 10:00:00,02.01.2015 10:00:00')]
    [TestCase('test2', '31.01.2015 10:00:00,01.02.2015 10:00:00')]
    [TestCase('test3', '31.12.2015 10:00:00,01.01.2016 10:00:00')]
    procedure TestIncreaseDay(const ADate: String; const AExpectedDate: String); overload;

    [TestCase('test1', '01.01.2015 10:00:00,30,31.01.2015 10:00:00')]
    [TestCase('test2', '01.01.2015 10:00:00,31,01.02.2015 10:00:00')]
    [TestCase('test3', '24.12.2015 10:00:00,8,01.01.2016 10:00:00')]
    procedure TestIncreaseDay(const ADate: String; const ANumber: Integer; const AExpectedDate: String); overload;

    [TestCase('test1', '01.01.2015 10:00:00,01.02.2015 10:00:00')]
    [TestCase('test2', '31.01.2015 10:00:00,28.02.2015 10:00:00')]
    [TestCase('test3', '27.01.2015 10:00:00,27.02.2015 10:00:00')]
    [TestCase('test4', '31.12.2015 10:00:00,31.01.2016 10:00:00')]
    procedure TestIncreaseMonth(const ADate: String; const AExpectedDate: String); overload;

    [TestCase('test1', '01.01.2015 10:00:00,5,01.06.2015 10:00:00')]
    [TestCase('test2', '31.01.2015 10:00:00,12,31.01.2016 10:00:00')]
    procedure TestIncreaseMonth(const ADate: String; const ANumber: Integer; const AExpectedDate: String); overload;

    [TestCase('test1', '01.01.2015 10:00:00,01.01.2016 10:00:00')]
    [TestCase('test2', '29.02.2004 10:00:00,28.02.2005 10:00:00')]
    procedure TestIncreaseYear(const ADate: String; const AExpectedDate: String); overload;

    [TestCase('test1', '01.01.2015 10:00:00,10,01.01.2025 10:00:00')]
    [TestCase('test2', '29.02.2004 10:00:00,2,28.02.2006 10:00:00')]
    procedure TestIncreaseYear(const ADate: String; const ANumber: Integer; const AExpectedDate: String); overload;

    [TestCase('test1', '01.01.2015 10:00:00,01.01.2015 11:00:00')]
    [TestCase('test2', '01.01.2015 23:00:00,02.01.2015 00:00:00')]
    procedure TestIncreaseHour(const ADate: String; const AExpectedDate: String); overload;

    [TestCase('test1', '01.01.2015 10:00:00,2,01.01.2015 12:00:00')]
    [TestCase('test2', '01.01.2015 10:00:00,24,02.01.2015 10:00:00')]
    procedure TestIncreaseHour(const ADate: String; const ANumber: Integer; const AExpectedDate: String); overload;

    [TestCase('test1', '01.01.2015 10:00:00,01.01.2015 10:01:00')]
    [TestCase('test2', '01.01.2015 23:59:00,02.01.2015 00:00:00')]
    procedure TestIncreaseMinute(const ADate: String; const AExpectedDate: String); overload;

    [TestCase('test1', '01.01.2015 10:00:00,10,01.01.2015 10:10:00')]
    [TestCase('test2', '01.01.2015 10:00:00,60,01.01.2015 11:00:00')]
    [TestCase('test3', '01.01.2015 23:59:00,60,02.01.2015 00:59:00')]
    procedure TestIncreaseMinute(const ADate: String; const ANumber: Integer; const AExpectedDate: String); overload;

    [TestCase('test1', '01.01.2015 10:00:00,01.01.2015 10:00:01')]
    [TestCase('test2', '01.01.2015 23:59:59,02.01.2015 00:00:00')]
    procedure TestIncreaseSecond(const ADate: String; const AExpectedDate: String); overload;

    [TestCase('test1', '01.01.2015 10:00:00,600,01.01.2015 10:10:00')]
    [TestCase('test2', '01.01.2015 10:00:00,3600,01.01.2015 11:00:00')]
    [TestCase('test3', '01.01.2015 23:59:00,3600,02.01.2015 00:59:00')]
    procedure TestIncreaseSecond(const ADate: String; const ANumber: Integer; const AExpectedDate: String); overload;

  end;

implementation

uses
  System.DateUtils,
  Delphi.SpecificationUtils.Helper.DateTime,
  System.SysUtils,
  Delphi.SpecificationUtils.Helper.Strings,
  Spring.SystemUtils,
  Delphi.SpecificationUtils.DateTime.Types;


{ TTestTDateTimeHelper }

function TTestTDateTimeHelper.Now: TDateTime;
begin
  Result := System.SysUtils.Now;
end;

procedure TTestTDateTimeHelper.TestDay(const ADate: string; const AExpectedDay: Integer);
begin
  Assert.AreEqual<TDateTime>(ADate.ToDateTime.Day, AExpectedDay);
end;

procedure TTestTDateTimeHelper.TestDayOfWeek(const ADate, AExpectedDay: String);
var
  LDayOfWeek: DayOfWeek;
begin
  LDayOfWeek := AExpectedDay;
  Assert.IsTrue(ADate.ToDate.DayOfWeek = LDayOfWeek);
end;

procedure TTestTDateTimeHelper.TestHour(const ADate: String;const AExpectedHour: Integer);
begin
  Assert.AreEqual<TDateTime>(ADate.ToDateTime.Hour, AExpectedHour);
end;

procedure TTestTDateTimeHelper.TestIncreaseDay(const ADate, AExpectedDate: String);
begin
  Assert.AreEqual<TDateTime>(ADate.ToDateTime.IncreaseDay, AExpectedDate.ToDateTime);
end;

procedure TTestTDateTimeHelper.TestIncreaseDay(const ADate: String; const ANumber: Integer; const AExpectedDate: String);
begin
  Assert.AreEqual<TDateTime>(ADate.ToDateTime.IncreaseDay(ANumber), AExpectedDate.ToDateTime);
end;

procedure TTestTDateTimeHelper.TestIncreaseHour(const ADate: String;
  const ANumber: Integer; const AExpectedDate: String);
begin
  Assert.AreEqual<TDateTime>(ADate.ToDateTime.IncreaseHour(ANumber), AExpectedDate.ToDateTime);
end;

procedure TTestTDateTimeHelper.TestIncreaseHour(const ADate,
  AExpectedDate: String);
begin
  Assert.AreEqual<TDateTime>(ADate.ToDateTime.IncreaseHour, AExpectedDate.ToDateTime);
end;

procedure TTestTDateTimeHelper.TestIncreaseMinute(const ADate,
  AExpectedDate: String);
begin
  Assert.AreEqual<TDateTime>(ADate.ToDateTime.IncreaseMinute, AExpectedDate.ToDateTime);
end;

procedure TTestTDateTimeHelper.TestIncreaseMinute(const ADate: String;
  const ANumber: Integer; const AExpectedDate: String);
begin
  Assert.AreEqual<TDateTime>(ADate.ToDateTime.IncreaseMinute(ANumber), AExpectedDate.ToDateTime);
end;

procedure TTestTDateTimeHelper.TestIncreaseMonth(const ADate: String;
  const ANumber: Integer; const AExpectedDate: String);
begin
  Assert.AreEqual<TDateTime>(ADate.ToDateTime.IncreaseMonth(ANumber), AExpectedDate.ToDateTime);
end;

procedure TTestTDateTimeHelper.TestIncreaseMonth(const ADate,
  AExpectedDate: String);
begin
  Assert.AreEqual<TDateTime>(ADate.ToDateTime.IncreaseMonth, AExpectedDate.ToDateTime);
end;

procedure TTestTDateTimeHelper.TestIncreaseSecond(const ADate,
  AExpectedDate: String);
begin
  Assert.AreEqual<TDateTime>(ADate.ToDateTime.IncreaseSecond, AExpectedDate.ToDateTime);
end;

procedure TTestTDateTimeHelper.TestIncreaseSecond(const ADate: String;
  const ANumber: Integer; const AExpectedDate: String);
begin
  Assert.AreEqual<TDateTime>(ADate.ToDateTime.IncreaseSecond(ANumber), AExpectedDate.ToDateTime);
end;

procedure TTestTDateTimeHelper.TestIncreaseYear(const ADate,
  AExpectedDate: String);
begin
  Assert.AreEqual<TDateTime>(ADate.ToDateTime.IncreaseYear, AExpectedDate.ToDateTime);
end;

procedure TTestTDateTimeHelper.TestIncreaseYear(const ADate: String;
  const ANumber: Integer; const AExpectedDate: String);
begin
  Assert.AreEqual<TDateTime>(ADate.ToDateTime.IncreaseYear(ANumber), AExpectedDate.ToDateTime);
end;

procedure TTestTDateTimeHelper.TestIsAM(const ADate: String);
begin
  Assert.IsTrue(ADate.ToDateTime.IsAM);
end;

procedure TTestTDateTimeHelper.TestIsPM(const ADate: String);
begin
  Assert.IsTrue(ADate.ToDateTime.IsPM);
end;

procedure TTestTDateTimeHelper.TestIsToday;
var
  LNow: TDateTime;
begin
  LNow := Now;
  Assert.IsTrue(LNow.IsToday);
end;

procedure TTestTDateTimeHelper.TestIsTomorrow;
var
  LTomorrow: TDateTime;
begin
  LTomorrow := Tomorrow;
  Assert.IsTrue(LTomorrow.IsTomorrow);
end;

procedure TTestTDateTimeHelper.TestIsYesterday;
var
  LYesterday: TDateTime;
begin
  LYesterday := Yesterday;
  Assert.IsTrue(LYesterday.IsYesterday);
end;

procedure TTestTDateTimeHelper.TestMinute(const ADate: String; const AExpectedMinute: Integer);
begin
  Assert.AreEqual<TDateTime>(ADate.ToDateTime.Minute, AExpectedMinute);
end;

procedure TTestTDateTimeHelper.TestMonth(const ADate: String; const AExpectedMonth: Integer);
begin
  Assert.AreEqual<TDateTime>(ADate.ToDateTime.Month, AExpectedMonth);
end;

procedure TTestTDateTimeHelper.TestMonthOfYear(const ADate, AExpectedMonth: String);
var
  LMonth: TMonth;
begin
  Assert.IsTrue(TEnum.TryParse<TMonth>(AExpectedMonth, LMonth));
  Assert.IsTrue(ADate.ToDate.MonthOfYear = LMonth);
end;

procedure TTestTDateTimeHelper.TestNow;
var
  LResultNow: TDateTime;
  LExpectedNow: TDateTime;
begin
  LResultNow := TDateTime.Now;
  LExpectedNow := Now;

  Assert.AreEqual<TDateTime>(YearOf(LResultNow), YearOf(LExpectedNow), 'Year not equal');
  Assert.AreEqual<TDateTime>(MonthOf(LResultNow), MonthOf(LExpectedNow), 'Month not equal');
  Assert.AreEqual<TDateTime>(DayOf(LResultNow), DayOf(LExpectedNow), 'Day not equal');
  Assert.AreEqual<TDateTime>(HourOf(LResultNow), HourOf(LExpectedNow), 'Hour not equal');
  Assert.AreEqual<TDateTime>(MinuteOf(LResultNow), MinuteOf(LExpectedNow), 'Minute not equal');
end;

procedure TTestTDateTimeHelper.TestSecond(const ADate: String; const AExpectedSecond: Integer);
begin
  Assert.AreEqual<TDateTime>(ADate.ToDateTime.Second, AExpectedSecond);
end;

procedure TTestTDateTimeHelper.TestTomorrow;
var
  LResultNow: TDateTime;
  LExpectedNow: TDateTime;
begin
  LResultNow := TDateTime.Tomorrow;
  LExpectedNow := System.DateUtils.Tomorrow;

  Assert.AreEqual<TDateTime>(YearOf(LResultNow), YearOf(LExpectedNow), 'Year not equal');
  Assert.AreEqual<TDateTime>(MonthOf(LResultNow), MonthOf(LExpectedNow), 'Month not equal');
  Assert.AreEqual<TDateTime>(DayOf(LResultNow), DayOf(LExpectedNow), 'Day not equal');
  Assert.AreEqual<TDateTime>(HourOf(LResultNow), HourOf(LExpectedNow), 'Hour not equal');
  Assert.AreEqual<TDateTime>(MinuteOf(LResultNow), MinuteOf(LExpectedNow), 'Minute not equal');
end;

procedure TTestTDateTimeHelper.TestYear(const ADate: String; const AExpectedYear: Integer);
begin
  Assert.AreEqual<TDateTime>(ADate.ToDateTime.Year, AExpectedYear);
end;

procedure TTestTDateTimeHelper.TestYesterday;
var
  LResultNow: TDateTime;
  LExpectedNow: TDateTime;
begin
  LResultNow := TDateTime.Yesterday;
  LExpectedNow := System.DateUtils.Yesterday;

  Assert.AreEqual<TDateTime>(YearOf(LResultNow), YearOf(LExpectedNow), 'Year not equal');
  Assert.AreEqual<TDateTime>(MonthOf(LResultNow), MonthOf(LExpectedNow), 'Month not equal');
  Assert.AreEqual<TDateTime>(DayOf(LResultNow), DayOf(LExpectedNow), 'Day not equal');
  Assert.AreEqual<TDateTime>(HourOf(LResultNow), HourOf(LExpectedNow), 'Hour not equal');
  Assert.AreEqual<TDateTime>(MinuteOf(LResultNow), MinuteOf(LExpectedNow), 'Minute not equal');
end;

initialization
  TDUnitX.RegisterTestFixture(TTestTDateTimeHelper);
end.
