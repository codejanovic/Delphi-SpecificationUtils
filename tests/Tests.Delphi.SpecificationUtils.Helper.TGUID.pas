unit Tests.Delphi.SpecificationUtils.Helper.TGUID;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  TTestGuidHelper = class(TObject) 
  public
    [TestCase('test1', '{87C59BEF-6D8C-4D67-BC25-57FC6CB636A7},{87C59BEF-6D8C-4D67-BC25-57FC6CB636A7}')]
    [TestCase('test2', '87C59BEF-6D8C-4D67-BC25-57FC6CB636A7},{87C59BEF-6D8C-4D67-BC25-57FC6CB636A7}')]
    [TestCase('test3', '{87C59BEF-6D8C-4D67-BC25-57FC6CB636A7,{87C59BEF-6D8C-4D67-BC25-57FC6CB636A7}')]
    [TestCase('test4', '87C59BEF-6D8C-4D67-BC25-57FC6CB636A7,{87C59BEF-6D8C-4D67-BC25-57FC6CB636A7}')]
    [TestCase('test5', ' {87C59BEF-6D8C-4D67-BC25-57FC6CB636A7}, {87C59BEF-6D8C-4D67-BC25-57FC6CB636A7}  ')]
    procedure TestGUIDsAreEqual(const ALeft: String; const ARight: String);

    [TestCase('test1', '{07C59BEF-6D8C-4D67-BC25-57FC6CB636A7}, {87C59BEF-6D8C-4D67-BC25-57FC6CB636A7}')]
    [TestCase('test2', '{A53BFEAF-D518-4D5B-B434-441C219177CC}, {87C59BEF-6D8C-4D67-BC25-57FC6CB636A7}')]
    procedure TestGUIDsAreNotEqual(const ALeft: String; const ARight: String);

    [TestCase('test1', '{87C59BEF-6D8C-4D67-BC25-57FC6CB636A7}')]
    procedure TestGUIDToString(const AGUID: String);
    
    [TestCase('test1', '{87C59BEF-6D8C-4D67-BC25-57FC6CB636A7}')]
    procedure TestReCreate(const AGUID: String);

    [TestCase('test1', '{87C59BEF-6D8C-4D67-BC25-57FC6CB636A7}')]
    procedure TestReCreateCreatesAValidGUID(const AGUID: String);
  end;

implementation

uses
  Delphi.SpecificationUtils.Helper.TGUID,
  Delphi.SpecificationUtils.Helper.Strings;


{ TTestGuidHelper }

procedure TTestGuidHelper.TestGUIDsAreEqual(const ALeft, ARight: String);
var
  LLeft,
  LRight: TGUID;
begin
  ALeft.TryToGUID(LLeft);
  ARight.TryToGUID(LRight);

  Assert.IsTrue(LLeft.Equals(LRight));
end;

procedure TTestGuidHelper.TestGUIDsAreNotEqual(const ALeft, ARight: String);
var
  LLeft,
  LRight: TGUID;
begin
  ALeft.TryToGUID(LLeft);
  ARight.TryToGUID(LRight);

  Assert.IsFalse(LLeft.Equals(LRight));
end;

procedure TTestGuidHelper.TestGUIDToString(const AGUID: String);
var
  LGuid: TGUID;
begin
  AGUID.TryToGUID(LGUID);
  Assert.AreEqual(AGUID, LGuid.ToString);
end;

procedure TTestGuidHelper.TestReCreate(const AGUID: String);
var
  LOldGUID: TGUID;
  LNewGUID: TGUID;
begin
  AGUID.TryToGUID(LOldGUID);
  AGUID.TryToGUID(LNewGUID);
  LNewGUID.ReCreate;

  Assert.IsFalse(LOldGUID.Equals(LNewGUID));
end;

procedure TTestGuidHelper.TestReCreateCreatesAValidGUID(const AGUID: String);
var
  LGUID: TGUID;
begin
  AGUID.TryToGUID(LGUID);
  LGUID.ReCreate;

  Assert.IsTrue(LGUID.ToString.IsGUID);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestGuidHelper);
end.
