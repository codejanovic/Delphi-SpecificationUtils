unit Tests.Delphi.SpecificationUtils.Arrays.Length;

interface
uses
  DUnitX.TestFramework, Delphi.SpecificationUtils.Arrays,
  Spring.DesignPatterns;

type

  [TestFixture]
  TTestArrayLength = class(TObject)
  protected
    fArraysLengthSpec: ISpecification<TArray<string>>;
    procedure SetupArraySpecWithLength(const AValue: Integer);
  public
    [TestCase('test1', 'a,b,c,d;4', ';')]
    [TestCase('test2', ';0', ';')]
    procedure TestArrayHasLength(const AValues: String; const AExpectedLength: Integer);
  end;

implementation

uses
  Delphi.SpecificationUtils.Helper.Strings;


{ TTestArrayLength }

procedure TTestArrayLength.SetupArraySpecWithLength(const AValue: Integer);
begin
  fArraysLengthSpec := TArrayHasLength<string>.Create(AValue);
end;

procedure TTestArrayLength.TestArrayHasLength(const AValues: String; const AExpectedLength: Integer);
begin
  SetupArraySpecWithLength(AExpectedLength);
  Assert.IsTrue(fArraysLengthSpec.IsSatisfiedBy(AValues.ToArray));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestArrayLength);
end.
