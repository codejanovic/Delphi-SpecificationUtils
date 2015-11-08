unit Tests.Delphi.SpecificationUtils.Arrays.EqualsInLength;

interface
uses
  DUnitX.TestFramework,
  Spring.DesignPatterns;

type

  [TestFixture]
  TTestArrayIsEqualInLength = class(TObject) 
  protected
    fAreEqualInLength: ISpecification<TArray<String>>;
  protected const
    fSetup = 'a,b,c,d';
  public
    [SetupFixture]
    procedure Setup;

    [TestCase('test1', 'a,b,c,d', ';')]
    [TestCase('test2', 'e,f,g,h', ';')]
    [TestCase('test3', '1,2,3,4', ';')]
    [TestCase('test4', '1,b,3,c', ';')]
    procedure TestAreEqualInLength(const AValues: String);
    [TestCase('test1', 'a,b,c', ';')]
    [TestCase('test2', 'a,b,c,d,e', ';')]
    [TestCase('test2', '', ';')]
    procedure TestAreNotEqualInLength(const AValues: String);
  end;

implementation

uses
  Delphi.SpecificationUtils.Arrays,
  Delphi.SpecificationUtils.Helper.Strings;

{ TTestArrayIsEqualInLength }

procedure TTestArrayIsEqualInLength.Setup;
begin
  fAreEqualInLength := TArrayEqualsInLength<String>.Create(fSetup.ToArray);
end;

procedure TTestArrayIsEqualInLength.TestAreEqualInLength(const AValues: String);
begin
  Assert.IsTrue(fAreEqualInLength.IsSatisfiedBy(AValues.ToArray));
end;

procedure TTestArrayIsEqualInLength.TestAreNotEqualInLength(const AValues: String);
begin
  Assert.IsFalse(fAreEqualInLength.IsSatisfiedBy(AValues.ToArray));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestArrayIsEqualInLength);
end.
