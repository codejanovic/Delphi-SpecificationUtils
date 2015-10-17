unit Tests.Delphi.SpecificationUtils.Arrays.Contains;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns;

type

  [TestFixture]
  TTestArrayContainsSpec = class(TObject) 
  protected
    fArrayContainsSpec: ISpecification<TArray<String>>;
  protected const
    fSetupContains = 'a';
  public
    [SetupFixture]
    procedure Setup;

    [TestCase('test1', 'a,b,c,d', ';')]
    [TestCase('test2', 'a,b', ';')]
    [TestCase('test3', 'a', ';')]
    [TestCase('test4', 'b,c,a,d', ';')]
    procedure TestArrayContains(const AValues: String);
    [TestCase('test1', '', ';')]
    [TestCase('test2', 'b,c,d', ';')]
    [TestCase('test2', 'b', ';')]
    procedure TestArrayDoesNotContains(const AValues: String);
  end;

implementation

uses
  Delphi.SpecificationUtils.Arrays,
  Delphi.SpecificationUtils.Helper.Strings,
  System.Generics.Defaults;


{ TTestArrayContainsSpec }

procedure TTestArrayContainsSpec.Setup;
begin
  fArrayContainsSpec := TArrayContains<String>.Create(fSetupContains, TEqualityComparer<string>.Default);
end;

procedure TTestArrayContainsSpec.TestArrayContains(const AValues: String);
begin
  Assert.IsTrue(fArrayContainsSpec.IsSatisfiedBy(AValues.ToArray));
end;

procedure TTestArrayContainsSpec.TestArrayDoesNotContains(const AValues: String);
begin
  Assert.IsFalse(fArrayContainsSpec.IsSatisfiedBy(AValues.ToArray));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestArrayContainsSpec);
end.
