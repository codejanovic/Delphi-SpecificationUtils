unit Tests.Delphi.SpecificationUtils.Strings.EndsWith.CaseSensitive;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns,
  Delphi.SpecificationUtils,
  Delphi.SpecificationUtils.Strings.CaseSensitive;

type

  [TestFixture]
  TTestStringCSEndsWith = class(TObject) 
  protected
    fStringCSEndsWithSpec: TSpecification<String>;
    procedure SetupSpecification(const ASubstring: String);
  public
    [TestCase('test1', 'House,e')]
    [TestCase('test2', 'House,se')]
    [TestCase('test3', 'House,use')]
    [TestCase('test4', 'House,ouse')]
    [TestCase('test5', 'House,House')]
    procedure TestEndsWithSubstring(const AString: string; const ASubString: string);
    [TestCase('test1', 'House,H')]
    [TestCase('test2', 'House,Ho')]
    [TestCase('test3', 'House,Hou')]
    [TestCase('test4', 'House,Hous')]
    procedure TestDoesNotEndsWithSubstring(const AString: string; const ASubString: string);
  end;

implementation

{ TTestStringCSEndsWith }

procedure TTestStringCSEndsWith.SetupSpecification(const ASubstring: String);
begin
  fStringCSEndsWithSpec := TStringCSEndsWith.Create(ASubstring);
end;

procedure TTestStringCSEndsWith.TestDoesNotEndsWithSubstring(const AString,ASubString: string);
begin
  SetupSpecification(ASubString);
  Assert.IsFalse(fStringCSEndsWithSpec.IsSatisfiedBy(AString));
end;

procedure TTestStringCSEndsWith.TestEndsWithSubstring(const AString, ASubString: string);
begin
  SetupSpecification(ASubString);
  Assert.IsTrue(fStringCSEndsWithSpec.IsSatisfiedBy(AString));
end;


initialization
  TDUnitX.RegisterTestFixture(TTestStringCSEndsWith);
end.
