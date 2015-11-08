unit Tests.Delphi.SpecificationUtils.Arrays.Equals;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns;

type

  [TestFixture]
  TTestArrayEqualsSpec = class(TObject)
  protected
    fAreEqual: ISpecification<TArray<String>>;
  protected const
    fSetup = 'a,b,c,d';
  public
    [SetupFixture]
    procedure Setup;

    [TestCase('test1', 'a,b,c,d', ';')]
    [TestCase('test2', 'd,c,b,a', ';')]
    [TestCase('test3', 'd,a,c,b', ';')]
    [TestCase('test4', 'a,c,b,d', ';')]
    procedure TestAreEqual(const AValues: String);
    [TestCase('test1', 'a,b,c', ';')]
    [TestCase('test2', 'a,b,c,e', ';')]
    procedure TestAreNotEqual(const AValues: String);
  end;

implementation

uses
  Delphi.SpecificationUtils.Arrays,
  Delphi.SpecificationUtils.Helper.Strings,
  System.Generics.Defaults;


{ TTestArrayEqualsSpec }

procedure TTestArrayEqualsSpec.Setup;
begin
  fAreEqual := TArrayEquals<string>.Create(fSetup.ToArray, TEqualityComparer<String>.Default);
end;

procedure TTestArrayEqualsSpec.TestAreEqual(const AValues: String);
begin
  Assert.IsTrue(fAreEqual.IsSatisfiedBy(AValues.ToArray));
end;

procedure TTestArrayEqualsSpec.TestAreNotEqual(const AValues: String);
begin
  Assert.IsFalse(fAreEqual.IsSatisfiedBy(AValues.ToArray));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestArrayEqualsSpec);
end.
