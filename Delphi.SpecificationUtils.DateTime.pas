unit Delphi.SpecificationUtils.DateTime;

interface

uses
  Spring.DesignPatterns;

type
  TDateTimeIsToday = class(TSpecificationBase<TDateTime>)
  public
    function IsSatisfiedBy(const item: TDateTime): Boolean; override;
  end;

  TDateTimeIsTomorrow = class(TSpecificationBase<TDateTime>)
  protected
    fIsTomorrow: ISpecification<TDateTime>;
  public
    constructor Create;
    function IsSatisfiedBy(const item: TDateTime): Boolean; override;
  end;

  TDateTimeIsYesterday = class(TSpecificationBase<TDateTime>)
  protected
    fIsYesterday: ISpecification<TDateTime>;
  public
    constructor Create;
    function IsSatisfiedBy(const item: TDateTime): Boolean; override;
  end;

  TDateTimeIsLeapYear = class(TSpecificationBase<TDateTime>)
  public
    function IsSatisfiedBy(const item: TDateTime): Boolean; override;
  end;

  TDateTimeEqualsDay = class(TSpecificationBase<TDateTime>)
  protected
    fDay: Integer;
  public
    constructor Create(const ADay: Integer);
    function IsSatisfiedBy(const item: TDateTime): Boolean; override;
  end;

  TDateTimeEqualsMonth = class(TSpecificationBase<TDateTime>)
  protected
    fMonth: Integer;
  public
    constructor Create(const AMonth: Integer);
    function IsSatisfiedBy(const item: TDateTime): Boolean; override;
  end;

  TDateTimeEqualsYear = class(TSpecificationBase<TDateTime>)
  protected
    fYear: Integer;
  public
    constructor Create(const AYear: Integer);
    function IsSatisfiedBy(const item: TDateTime): Boolean; override;
  end;

  TDateTimeEqualsHour = class(TSpecificationBase<TDateTime>)
  protected
    fHour: Integer;
  public
    constructor Create(const AHour: Integer);
    function IsSatisfiedBy(const item: TDateTime): Boolean; override;
  end;

  TDateTimeEqualsMinute = class(TSpecificationBase<TDateTime>)
  protected
    fMinute: Integer;
  public
    constructor Create(const AMinute: Integer);
    function IsSatisfiedBy(const item: TDateTime): Boolean; override;
  end;

  TDateTimeEqualsSecond = class(TSpecificationBase<TDateTime>)
  protected
    fSecond: Integer;
  public
    constructor Create(const ASecond: Integer);
    function IsSatisfiedBy(const item: TDateTime): Boolean; override;
  end;

implementation

uses
  System.DateUtils,
  Delphi.SpecificationUtils.Helper.DateTime,
  System.SysUtils;

{ TDateTimeIsToday }

function TDateTimeIsToday.IsSatisfiedBy(const item: TDateTime): Boolean;
begin
  Result := System.DateUtils.IsToday(item);
end;

{ TDateTimeIsTomorrow }

constructor TDateTimeIsTomorrow.Create;
var
  LTomorrow: TDateTime;
  LEqualsMonth: TSpecification<TDateTime>;
  LEqualsYear: TSpecification<TDateTime>;
  LEqualsDay: TSpecification<TDateTime>;
begin
  LTomorrow := TDateTime.Tomorrow;
  LEqualsMonth := TDateTimeEqualsMonth.Create(LTomorrow.Month);
  LEqualsYear := TDateTimeEqualsYear.Create(LTomorrow.Year);
  LEqualsDay := TDateTimeEqualsDay.Create(LTomorrow.Day);

  fIsTomorrow := LEqualsMonth and LEqualsYear and LEqualsDay;
end;

function TDateTimeIsTomorrow.IsSatisfiedBy(const item: TDateTime): Boolean;
begin
  Result := fIsTomorrow.IsSatisfiedBy(item);
end;

{ TDateTimeEqualsDay }

constructor TDateTimeEqualsDay.Create(const ADay: Integer);
begin
  fDay := ADay;
end;

function TDateTimeEqualsDay.IsSatisfiedBy(const item: TDateTime): Boolean;
begin
  Result := item.Day = fDay;
end;

{ TDateTimeEqualsMonth }

constructor TDateTimeEqualsMonth.Create(const AMonth: Integer);
begin
  fMonth := AMonth;
end;

function TDateTimeEqualsMonth.IsSatisfiedBy(const item: TDateTime): Boolean;
begin
  Result := fMonth = item.Month;
end;

{ TDateTimeEqualsYear }

constructor TDateTimeEqualsYear.Create(const AYear: Integer);
begin
  fYear := AYear;
end;

function TDateTimeEqualsYear.IsSatisfiedBy(const item: TDateTime): Boolean;
begin
  Result := fYear = item.Year;
end;

{ TDateTimeIsYesterday }

constructor TDateTimeIsYesterday.Create;
var
  LYesterday: TDateTime;
  LEqualsMonth: TSpecification<TDateTime>;
  LEqualsYear: TSpecification<TDateTime>;
  LEqualsDay: TSpecification<TDateTime>;
begin
  LYesterday := TDateTime.Yesterday;
  LEqualsMonth := TDateTimeEqualsMonth.Create(LYesterday.Month);
  LEqualsYear := TDateTimeEqualsYear.Create(LYesterday.Year);
  LEqualsDay := TDateTimeEqualsDay.Create(LYesterday.Day);

  fIsYesterday := LEqualsMonth and LEqualsYear and LEqualsDay;
end;

function TDateTimeIsYesterday.IsSatisfiedBy(const item: TDateTime): Boolean;
begin
  Result := fIsYesterday.IsSatisfiedBy(item);
end;

{ TDateTimeEqualsMinute }

constructor TDateTimeEqualsMinute.Create(const AMinute: Integer);
begin
  fMinute := AMinute;
end;

function TDateTimeEqualsMinute.IsSatisfiedBy(const item: TDateTime): Boolean;
begin
  Result := fMinute = item.Minute;
end;

{ TDateTimeEqualsSecond }

constructor TDateTimeEqualsSecond.Create(const ASecond: Integer);
begin
  fSecond := ASecond;
end;

function TDateTimeEqualsSecond.IsSatisfiedBy(const item: TDateTime): Boolean;
begin
  Result := fSecond = item.Second;
end;

{ TDateTimeEqualsHour }

constructor TDateTimeEqualsHour.Create(const AHour: Integer);
begin
  fHour := AHour;
end;

function TDateTimeEqualsHour.IsSatisfiedBy(const item: TDateTime): Boolean;
begin
  Result := fHour = item.Hour;
end;

{ TDateTimeIsLeapYear }

function TDateTimeIsLeapYear.IsSatisfiedBy(const item: TDateTime): Boolean;
begin
  Result := System.SysUtils.IsLeapYear(item.Year);
end;

end.
