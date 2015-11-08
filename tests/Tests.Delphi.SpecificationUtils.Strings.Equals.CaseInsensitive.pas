unit Tests.Delphi.SpecificationUtils.Strings.Equals.CaseInsensitive;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns, Delphi.SpecificationUtils.Strings.IgnoreCase;

type

  [TestFixture]
  TTestStringEqualsCaseInsensitive = class(TObject) 
  protected
    fStringEqualsCaseInsensitiveSpec: TSpecification<String>;
    procedure SetupSpecification(const AStringToEqual: String);
  public
    [TestCase('test1','House,House')]
    [TestCase('test2','House, House  ')]
    [TestCase('test3','Cat,Cat')]
    [TestCase('test4','Dog,Dog')]
    [TestCase('test5','House,house')]
    [TestCase('test6','house,House')]
    [TestCase('test7','House,HouSe')]
    procedure TestLeftEqualsRight(const ALeft: String; const ARight: String);

    [TestCase('test1','House,Hous')]
    [TestCase('test1','cat,dog')]
    procedure TestLeftNotEqualsRight(const ALeft: String; const ARight: String);
  end;

implementation

procedure TTestStringEqualsCaseInsensitive.SetupSpecification(const AStringToEqual: String);
begin
  fStringEqualsCaseInsensitiveSpec := TStringEqualsIgnoreCase.Create(AStringToEqual);
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
