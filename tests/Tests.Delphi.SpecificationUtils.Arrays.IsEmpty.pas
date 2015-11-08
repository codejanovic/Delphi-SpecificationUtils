unit Tests.Delphi.SpecificationUtils.Arrays.IsEmpty;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns;

type

  [TestFixture]
  TTestArrayIsEmpty = class(TObject)
  protected
    fArraysIsEmptySpec: ISpecification<TArray<string>>;
  public
    [SetupFixture]
    procedure Setup;
    [TestCase('test2', '', ';')]
    procedure TestArrayIsEmpty(const AValues: String);
    [TestCase('test1', 'a,b,c,d', ';')]
    procedure TestArrayIsNotEmpty(const AValues: String);
  end;

implementation

uses
  Delphi.SpecificationUtils.Arrays,
  Delphi.SpecificationUtils.Helper.Strings;


{ TTestArrayIsEmpty }

procedure TTestArrayIsEmpty.Setup;
begin
  fArraysIsEmptySpec := TArrayIsEmpty<string>.Create;
end;

procedure TTestArrayIsEmpty.TestArrayIsEmpty(const AValues: String);
begin
  Assert.IsTrue(fArraysIsEmptySpec.IsSatisfiedBy(AValues.ToArray));
end;

procedure TTestArrayIsEmpty.TestArrayIsNotEmpty(const AValues: String);
begin
  Assert.IsFalse(fArraysIsEmptySpec.IsSatisfiedBy(AValues.ToArray));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestArrayIsEmpty);
end.
