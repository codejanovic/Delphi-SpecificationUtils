unit Tests.Delphi.SpecificationUtils.Strings.StartsWith.CaseInsensitive;

interface
uses
  DUnitX.TestFramework,
  Spring.DesignPatterns,
  Delphi.SpecificationUtils,
  Delphi.SpecificationUtils.Strings.CaseInsensitive;

type

  [TestFixture]
  TTestStringCIStartsWith = class(TObject)
  protected
    fStringCIStartsWithSpec: TSpecification<String>;
    procedure SetupSpecification(const ASubstring: String);
  public
    [TestCase('test1', 'House,H')]
    [TestCase('test1', 'House,h')]
    [TestCase('test3', 'House,Hou')]
    [TestCase('test3', 'House,hou')]
    procedure TestStartsWithSubstring(const AString: string; const ASubString: string);
    [TestCase('test1', 'House,e')]
    [TestCase('test2', 'House,se')]
    [TestCase('test3', 'House,usE')]
    [TestCase('test4', 'House,ouSe')]
    procedure TestDoesNotStartsWithSubstring(const AString: string; const ASubString: string);
  end;

implementation

{ TTestStringCIStartsWith }

procedure TTestStringCIStartsWith.SetupSpecification(const ASubstring: String);
begin
  fStringCIStartsWithSpec := TStringCIStartsWith.Create(ASubstring);
end;

procedure TTestStringCIStartsWith.TestDoesNotStartsWithSubstring(const AString,ASubString: string);
begin
  SetupSpecification(ASubString);
  Assert.IsFalse(fStringCIStartsWithSpec.IsSatisfiedBy(AString));
end;

procedure TTestStringCIStartsWith.TestStartsWithSubstring(const AString, ASubString: string);
begin
  SetupSpecification(ASubString);
  Assert.IsTrue(fStringCIStartsWithSpec.IsSatisfiedBy(AString));
end;


initialization
  TDUnitX.RegisterTestFixture(TTestStringCIStartsWith);
end.
