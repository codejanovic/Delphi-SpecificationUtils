unit Tests.Delphi.SpecificationUtils.Helper.Boolean;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  TTestBooleanHelper = class(TObject) 
  public
    [TestCase('1','true,1')]
    [TestCase('2','false,0')]
    procedure TestToInteger(const AValue: Boolean; const AExpected: Integer);

    [TestCase('1','true,true')]
    [TestCase('2','false,false')]
    procedure TestToString(const AValue: Boolean; const AExpected: String);
  end;

implementation

uses
  Delphi.SpecificationUtils.Helper.Boolean;


{ TTestBooleanHelper }

procedure TTestBooleanHelper.TestToInteger(const AValue: Boolean;
  const AExpected: Integer);
begin
  Assert.AreEqual(AExpected, AValue.ToInteger);
end;

procedure TTestBooleanHelper.TestToString(const AValue: Boolean;
  const AExpected: String);
begin
  Assert.AreEqual(AExpected, AValue.ToString);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestBooleanHelper);
end.
