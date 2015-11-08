unit Tests.Delphi.SpecificationUtils.Strings.EndsWith.CaseInsensitive;

interface
uses
  DUnitX.TestFramework,
  Spring.DesignPatterns,

  Delphi.SpecificationUtils.Strings.IgnoreCase;

type

  [TestFixture]
  TTestStringCIEndsWith = class(TObject)
  protected
    fStringCIEndsWithSpec: TSpecification<String>;
    procedure SetupSpecification(const ASubstring: String);
  public
    [TestCase('test1', 'House,e')]
    [TestCase('test1', 'House,E')]
    [TestCase('test3', 'House,usE')]
    [TestCase('test3', 'House,use')]
    procedure TestEndsWithSubstring(const AString: string; const ASubString: string);
    [TestCase('test1', 'House,H')]
    [TestCase('test2', 'House,Ho')]
    [TestCase('test3', 'House,hou')]
    [TestCase('test4', 'House,hOu')]
    procedure TestDoesNotEndsWithSubstring(const AString: string; const ASubString: string);
  end;

implementation

{ TTestStringCIEndsWith }

procedure TTestStringCIEndsWith.SetupSpecification(const ASubstring: String);
begin
  fStringCIEndsWithSpec := TStringEndsWithIgnoreCase.Create(ASubstring);
end;

procedure TTestStringCIEndsWith.TestDoesNotEndsWithSubstring(const AString,ASubString: string);
begin
  SetupSpecification(ASubString);
  Assert.IsFalse(fStringCIEndsWithSpec.IsSatisfiedBy(AString));
end;

procedure TTestStringCIEndsWith.TestEndsWithSubstring(const AString, ASubString: string);
begin
  SetupSpecification(ASubString);
  Assert.IsTrue(fStringCIEndsWithSpec.IsSatisfiedBy(AString));
end;


initialization
  TDUnitX.RegisterTestFixture(TTestStringCIEndsWith);
end.
