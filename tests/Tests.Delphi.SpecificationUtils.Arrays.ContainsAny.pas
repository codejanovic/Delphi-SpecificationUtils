unit Tests.Delphi.SpecificationUtils.Arrays.ContainsAny;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns;

type

  [TestFixture]
  TTestArrayContainsAnySpec = class(TObject) 
  protected
    fArrayContainsAnySpec: ISpecification<TArray<String>>;
  protected const
    fSetupContains = 'a,b,c';
  public
    [SetupFixture]
    procedure Setup;

    [TestCase('test1', 'a,b,c,d', ';')]
    [TestCase('test2', 'a,d', ';')]
    [TestCase('test3', 'e,f,g,c', ';')]
    procedure TestArrayContainsAny(const AValues: String);
    [TestCase('test1', '', ';')]
    [TestCase('test2', 'e,f,g', ';')]
    [TestCase('test2', 'e', ';')]
    procedure TestArrayDoesNotContainsAny(const AValues: String);
  end;

implementation

uses
  Delphi.SpecificationUtils.Arrays,
  Delphi.SpecificationUtils.Helper.Strings,
  System.Generics.Defaults;


{ TTestArrayContainsAnySpec }

procedure TTestArrayContainsAnySpec.Setup;
begin
  fArrayContainsAnySpec := TArrayContainsAny<String>.Create(fSetupContains.ToArray, TEqualityComparer<string>.Default);
end;

procedure TTestArrayContainsAnySpec.TestArrayContainsAny(const AValues: String);
begin
  Assert.IsTrue(fArrayContainsAnySpec.IsSatisfiedBy(AValues.ToArray));
end;

procedure TTestArrayContainsAnySpec.TestArrayDoesNotContainsAny(const AValues: String);
begin
  Assert.IsFalse(fArrayContainsAnySpec.IsSatisfiedBy(AValues.ToArray));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestArrayContainsAnySpec);
end.
