unit Tests.Delphi.SpecificationUtils.Strings.Contains.CaseSensitive;

interface
uses
  DUnitX.TestFramework,
  Delphi.SpecificationUtils,
  Delphi.SpecificationUtils.Strings.CaseSensitive,
  Spring.DesignPatterns;

type

  [TestFixture]
  TTestStringContainsSensitive = class(TObject)
  protected
    fStringCaseSensitiveContainsSpec: TSpecification<String>;
    procedure SetupSpecification(const ASubstring: String);
  public
    [TestCase('test1', 'House,H')]
    [TestCase('test2', 'House,o')]
    [TestCase('test3', 'House,use')]
    procedure TestContainsSubstring(const AString: string; const ASubString: string);
    [TestCase('test1', 'House,h')]
    [TestCase('test2', 'House,O')]
    [TestCase('test3', 'House,Use')]
    procedure TestDoesNotContainsSubstring(const AString: string; const ASubString: string);
  end;

implementation


{ TMyTestObject }

procedure TTestStringContainsSensitive.SetupSpecification(const ASubstring: String);
begin
  fStringCaseSensitiveContainsSpec := TStringCSContains.Create(ASubstring);
end;

procedure TTestStringContainsSensitive.TestContainsSubstring(const AString: string; const ASubString: string);
begin
  SetupSpecification(ASubString);
  Assert.IsTrue(fStringCaseSensitiveContainsSpec.IsSatisfiedBy(AString), 'substring "'+ ASubString + '"'+ ' expected to be found in string "' + AString +'".' );
end;

procedure TTestStringContainsSensitive.TestDoesNotContainsSubstring(const AString, ASubString: string);
begin
  SetupSpecification(ASubString);
   Assert.IsFalse(fStringCaseSensitiveContainsSpec.IsSatisfiedBy(AString), 'substring "'+ ASubString + '"'+ ' not expected to be found in string "' + AString +'".' );
end;

initialization
  TDUnitX.RegisterTestFixture(TTestStringContainsSensitive);
end.
