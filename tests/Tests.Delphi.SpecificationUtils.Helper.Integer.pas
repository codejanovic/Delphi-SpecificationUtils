unit Tests.Delphi.SpecificationUtils.Helper.Integer;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  TTestIntegerHelper = class(TObject) 
  public
    [TestCase('1','0,0')]
    [TestCase('2','-999,-999')]
    [TestCase('3','999,999')]
    procedure TestToString(const AValue: Integer; const AExpected: String);

    [TestCase('1','0,false')]
    [TestCase('2','-1,true')]
    [TestCase('3','1,true')]
    procedure TestToBoolean(const AValue: Integer; const AExpected: Boolean);

    [TestCase('1','0,000000')]
    [TestCase('2','1,000001')]
    [TestCase('3','-1,FFFFFFFF')]
    [TestCase('4','100,000064')]
    [TestCase('5','-100,FFFFFF9C')]
    procedure TestToHexString(const AValue: Integer; const AExpected: String);

    [TestCase('1','0,0.0')]
    [TestCase('2','-1,-1.0')]
    [TestCase('3','1,1.0')]
    procedure TestToExtended(const AValue: Integer; const AExpected: Extended);

    [TestCase('1','0,0,true')]
    [TestCase('2','-1,-1,true')]
    [TestCase('3','1,1,true')]
    [TestCase('4','-1,1,false')]
    [TestCase('5','1,-1,false')]
    procedure TestEquals(const Aleft: Integer; const ARight: Integer; const AExpected: boolean);

    [TestCase('1', '2,1,true')]
    [TestCase('2', '2,2,false')]
    [TestCase('3', '1,2,false')]
    procedure TestIsGreaterThan(const ALeft: Integer; const ARight: Integer; AExpected: boolean);
    [TestCase('1', '2,1,true')]
    [TestCase('2', '2,2,true')]
    [TestCase('3', '1,2,false')]
    procedure TestIsGreaterThanOrEquals(const ALeft: Integer; const ARight: Integer; AExpected: boolean);
    [TestCase('1', '2,1,false')]
    [TestCase('2', '2,2,false')]
    [TestCase('3', '1,2,true')]
    procedure TestIsLessThan(const ALeft: Integer; const ARight: Integer; AExpected: boolean);
    [TestCase('1', '2,1,false')]
    [TestCase('2', '2,2,true')]
    [TestCase('3', '1,2,true')]
    procedure TestIsLessThanOrEquals(const ALeft: Integer; const ARight: Integer; AExpected: boolean);

    [TestCase('1', '0,1,4,false')]
    [TestCase('2', '1,1,4,false')]
    [TestCase('3', '2,1,4,true')]
    [TestCase('4', '3,1,4,true')]
    [TestCase('5', '4,1,4,false')]
    [TestCase('5', '5,1,4,false')]
    procedure TestBetween(const AValue: Integer; const ABetweenLeft: Integer; const ABetweenRight: Integer; AExpected: boolean);
  end;

implementation

uses
  Delphi.SpecificationUtils.Helper.Integer;


{ TTestIntegerHelper }

procedure TTestIntegerHelper.TestBetween(const AValue: Integer; const ABetweenLeft: Integer; const ABetweenRight: Integer; AExpected: boolean);
begin
  Assert.AreEqual(AExpected, AValue.IsBetween(ABetweenLeft, ABetweenRight));
end;

procedure TTestIntegerHelper.TestEquals(const Aleft, ARight: Integer;
  const AExpected: boolean);
begin
  Assert.AreEqual(AExpected, Aleft.Equals(Aright));
end;

procedure TTestIntegerHelper.TestIsGreaterThan(const ALeft, ARight: Integer; AExpected: boolean);
begin
  Assert.AreEqual(AExpected, ALeft.IsGreaterThan(ARight));
end;

procedure TTestIntegerHelper.TestIsGreaterThanOrEquals(const ALeft, ARight: Integer; AExpected: boolean);
begin
  Assert.AreEqual(AExpected, ALeft.IsGreaterThanOrEquals(ARight));
end;

procedure TTestIntegerHelper.TestIsLessThan(const ALeft, ARight: Integer; AExpected: boolean);
begin
   Assert.AreEqual(AExpected, ALeft.IsLessThan(ARight));
end;

procedure TTestIntegerHelper.TestIsLessThanOrEquals(const ALeft, ARight: Integer; AExpected: boolean);
begin
   Assert.AreEqual(AExpected, ALeft.IsLessThanOrEquals(ARight));
end;

procedure TTestIntegerHelper.TestToBoolean(const AValue: Integer;
  const AExpected: Boolean);
begin
  Assert.AreEqual(AExpected, AValue.ToBoolean);
end;

procedure TTestIntegerHelper.TestToExtended(const AValue: Integer;
  const AExpected: Extended);
begin
  Assert.AreEqual(AExpected, AValue.ToExtended);
end;

procedure TTestIntegerHelper.TestToHexString(const AValue: Integer;
  const AExpected: String);
begin
  Assert.AreEqual(AExpected, AValue.ToHex(6));
end;

procedure TTestIntegerHelper.TestToString(const AValue: Integer;
  const AExpected: String);
begin
  Assert.AreEqual(AExpected, AValue.ToString);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestIntegerHelper);
end.
