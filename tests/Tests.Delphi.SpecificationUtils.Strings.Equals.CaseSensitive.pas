unit Tests.Delphi.SpecificationUtils.Strings.Equals.CaseSensitive;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns, Delphi.SpecificationUtils, Delphi.SpecificationUtils.Strings.CaseSensitive;

type

  [TestFixture]
  TTestStringEqualsCaseSensitive = class(TObject)
  protected
    fStringEqualsCaseSensitiveSpec: TSpecification<String>;
    procedure SetupSpecification(const AStringToEqual: String);
  public
    [TestCase('test1','House,House')]
    [TestCase('test2','Cat,Cat')]
    [TestCase('test3','Dog,Dog')]
    procedure TestLeftEqualsRight(const ALeft: String; const ARight: String);
    [TestCase('test1','House,house')]
    [TestCase('test2','house,House')]
    [TestCase('test3','House,HouSe')]
    procedure TestLeftNotEqualsRight(const ALeft: String; const ARight: String);
  end;

implementation

procedure TTestStringEqualsCaseSensitive.SetupSpecification(const AStringToEqual: String);
begin
  fStringEqualsCaseSensitiveSpec := TStringCSEquals.Create(AStringToEqual);
end;

procedure TTestStringEqualsCaseSensitive.TestLeftEqualsRight(const ALeft,ARight: String);
begin
  SetupSpecification(ARight);
  Assert.IsTrue(fStringEqualsCaseSensitiveSpec.IsSatisfiedBy(ALeft));
end;

procedure TTestStringEqualsCaseSensitive.TestLeftNotEqualsRight(const ALeft, ARight: String);
begin
  SetupSpecification(ARight);
  Assert.IsFalse(fStringEqualsCaseSensitiveSpec.IsSatisfiedBy(ALeft));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestStringEqualsCaseSensitive);
end.
