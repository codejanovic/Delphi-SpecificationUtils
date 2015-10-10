unit Tests.Delphi.SpecificationUtils.Strings.Equals.CaseInsensitive;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns, Delphi.SpecificationUtils, Delphi.SpecificationUtils.Strings.CaseInsensitive;

type

  [TestFixture]
  TTestStringEqualsCaseInsensitive = class(TObject) 
  protected
    fStringEqualsCaseInsensitiveSpec: TSpecification<String>;
    procedure SetupSpecification(const AStringToEqual: String);
  public
    [TestCase('test1','House,House')]
    [TestCase('test2','Cat,Cat')]
    [TestCase('test3','Dog,Dog')]
    [TestCase('test4','House,house')]
    [TestCase('test5','house,House')]
    [TestCase('test6','House,HouSe')]
    procedure TestLeftEqualsRight(const ALeft: String; const ARight: String);

    [TestCase('test1','House,Hous')]
    [TestCase('test1','cat,dog')]
    procedure TestLeftNotEqualsRight(const ALeft: String; const ARight: String);
  end;

implementation

procedure TTestStringEqualsCaseInsensitive.SetupSpecification(const AStringToEqual: String);
begin
  fStringEqualsCaseInsensitiveSpec := TStringCIEquals.Create(AStringToEqual);
end;

procedure TTestStringEqualsCaseInsensitive.TestLeftEqualsRight(const ALeft,ARight: String);
begin
  SetupSpecification(ARight);
  Assert.IsTrue(fStringEqualsCaseInsensitiveSpec.IsSatisfiedBy(ALeft));
end;

procedure TTestStringEqualsCaseInsensitive.TestLeftNotEqualsRight(const ALeft, ARight: String);
begin
  SetupSpecification(ARight);
  Assert.IsFalse(fStringEqualsCaseInsensitiveSpec.IsSatisfiedBy(ALeft));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestStringEqualsCaseInsensitive);
end.
