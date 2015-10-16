unit Tests.Delphi.SpecificationUtils.Strings.Contains.CaseInsensitive;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns;

type

  [TestFixture]
  TTestStringContainsCaseInsensitive = class(TObject)
  protected
    fStringCaseInsensitiveContainsSpec: TSpecification<String>;
    procedure SetupSpecification(const ASubstring: String);
  public
    [TestCase('test1', 'House,H')]
    [TestCase('test2', 'House,h')]
    [TestCase('test3', 'House,use')]
    [TestCase('test4', 'House,Use')]
    [TestCase('test5', 'House,O')]
    procedure TestContainsSubstring(const AString: string; const ASubString: string);
    [TestCase('test1', 'House,a')]
    [TestCase('test2', 'House,b')]
    [TestCase('test3', 'House,cat')]
    procedure TestDoesNotContainsSubstring(const AString: string; const ASubString: string);
  end;

implementation

uses
  Delphi.SpecificationUtils,
  Delphi.SpecificationUtils.Strings.CaseInsensitive;


{ TMyTestObject }


procedure TTestStringContainsCaseInsensitive.SetupSpecification(const ASubstring: String);
begin
  fStringCaseInsensitiveContainsSpec := TStringCIContains.Create(ASubstring);
end;

procedure TTestStringContainsCaseInsensitive.TestContainsSubstring(const AString: string; const ASubString: string);
begin
  SetupSpecification(ASubString);
  Assert.IsTrue(fStringCaseInsensitiveContainsSpec.IsSatisfiedBy(AString), 'substring "'+ ASubString + '"'+ ' expected to be found in string "' + AString +'".' );
end;

procedure TTestStringContainsCaseInsensitive.TestDoesNotContainsSubstring(const AString, ASubString: string);
begin
  SetupSpecification(ASubString);
  Assert.IsFalse(fStringCaseInsensitiveContainsSpec.IsSatisfiedBy(AString), 'substring "'+ ASubString + '"'+ ' not expected to be found in string "' + AString +'".' );
end;

initialization
  TDUnitX.RegisterTestFixture(TTestStringContainsCaseInsensitive);
end.
