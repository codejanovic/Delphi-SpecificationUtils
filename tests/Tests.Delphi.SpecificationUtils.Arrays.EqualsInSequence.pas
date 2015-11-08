unit Tests.Delphi.SpecificationUtils.Arrays.EqualsInSequence;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns;

type

  [TestFixture]
  TTestArrayEqualsInSequence = class(TObject) 
  protected
    fAreEqualInSequence: ISpecification<TArray<String>>;
  protected const
    fSetup = 'a,b,c,d';
  public
    [SetupFixture]
    procedure Setup;

    [TestCase('test1', 'a,b,c,d', ';')]
    procedure TestAreEqualInSequence(const AValues: String);
    [TestCase('test1', 'a,b,c', ';')]
    [TestCase('test2', 'd,c,b,a', ';')]
    [TestCase('test3', 'd,a,c,b', ';')]
    [TestCase('test4', 'a,c,b,d', ';')]
    [TestCase('test5', 'a,b,c,e', ';')]
    [TestCase('test5', '', ';')]
    procedure TestAreNotEqualInSequence(const AValues: String);
  end;

implementation

uses
  Delphi.SpecificationUtils.Arrays,
  Delphi.SpecificationUtils.Helper.Strings,
  System.Generics.Defaults;


{ TTestArrayEqualsInSequence }

procedure TTestArrayEqualsInSequence.Setup;
begin
  fAreEqualInSequence := TArrayEqualsInSequence<String>.Create(fSetup.ToArray, TEqualityComparer<string>.Default);
end;

procedure TTestArrayEqualsInSequence.TestAreEqualInSequence(const AValues: String);
begin
  Assert.IsTrue(fAreEqualInSequence.IsSatisfiedBy(AValues.ToArray));
end;

procedure TTestArrayEqualsInSequence.TestAreNotEqualInSequence(const AValues: String);
begin
  Assert.IsFalse(fAreEqualInSequence.IsSatisfiedBy(AValues.ToArray));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestArrayEqualsInSequence);
end.
