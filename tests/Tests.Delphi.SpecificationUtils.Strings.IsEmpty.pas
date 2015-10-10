unit Tests.Delphi.SpecificationUtils.Strings.IsEmpty;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns,
  Delphi.SpecificationUtils.Strings;

type

  [TestFixture]
  TTestStringIsEmpty = class(TObject)
  protected
    fStringIsEmptySpec: TSpecification<String>;
  public
    [SetupFixture]
    procedure Setup;
    [TestCase('test1', '')]
    [TestCase('test2', '   ')]
    procedure TestIsEmpty(const AString: String);
    [TestCase('test1', 'one')]
    [TestCase('test2', 'o')]
    procedure TestIsNotEmpty(const AString: String);
  end;

implementation


{ TTestStringIsEmpty }

procedure TTestStringIsEmpty.Setup;
begin
  fStringIsEmptySpec := TStringIsEmpty.Create;
end;

procedure TTestStringIsEmpty.TestIsEmpty(const AString: String);
begin
  Assert.IsTrue(fStringIsEmptySpec.IsSatisfiedBy(AString));
end;

procedure TTestStringIsEmpty.TestIsNotEmpty(const AString: String);
begin
  Assert.IsFalse(fStringIsEmptySpec.IsSatisfiedBy(AString));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestStringIsEmpty);
end.
