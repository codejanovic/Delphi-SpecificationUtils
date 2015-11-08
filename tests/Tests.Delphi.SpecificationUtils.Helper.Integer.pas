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

    [TestCase('1','0,0')]
    [TestCase('2','1,1')]
    [TestCase('3','-1,FFFFFFFF')]
    [TestCase('4','100,64')]
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
  end;

implementation

uses
  Delphi.SpecificationUtils.Helper.Integer;


{ TTestIntegerHelper }

procedure TTestIntegerHelper.TestEquals(const Aleft, ARight: Integer;
  const AExpected: boolean);
begin
  Assert.AreEqual(AExpected, Aleft.Equals(Aright));
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
  Assert.AreEqual(AExpected, AValue.ToHexString);
end;

procedure TTestIntegerHelper.TestToString(const AValue: Integer;
  const AExpected: String);
begin
  Assert.AreEqual(AExpected, AValue.ToString);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestIntegerHelper);
end.
