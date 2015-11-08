unit Tests.Delphi.SpecificationUtils.Strings.StartsWith.CaseSensitive;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns,

  Delphi.SpecificationUtils.Strings.CaseSensitive;

type

  [TestFixture]
  TTestStringCSStartsWith = class(TObject) 
  protected
    fStringCSStartsWithSpec: TSpecification<String>;
    procedure SetupSpecification(const ASubstring: String);
  public
    [TestCase('test1', 'House,H')]
    [TestCase('test2', 'House,Ho')]
    [TestCase('test3', 'House,Hou')]
    [TestCase('test4', 'House,Hous')]
    [TestCase('test5', 'House,House')]
    procedure TestStartsWithSubstring(const AString: string; const ASubString: string);
    [TestCase('test1', 'House,e')]
    [TestCase('test2', 'House,se')]
    [TestCase('test3', 'House,use')]
    [TestCase('test4', 'House,ouse')]
    [TestCase('test5', 'House,h')]
    [TestCase('test6', 'House,hou')]
    procedure TestDoesNotStartsWithSubstring(const AString: string; const ASubString: string);
  end;

implementation

{ TTestStringCSStartsWith }

procedure TTestStringCSStartsWith.SetupSpecification(const ASubstring: String);
begin
  fStringCSStartsWithSpec := TStringStartsWith.Create(ASubstring);
end;

procedure TTestStringCSStartsWith.TestDoesNotStartsWithSubstring(const AString,ASubString: string);
begin
  SetupSpecification(ASubString);
  Assert.IsFalse(fStringCSStartsWithSpec.IsSatisfiedBy(AString));
end;

procedure TTestStringCSStartsWith.TestStartsWithSubstring(const AString, ASubString: string);
begin
  SetupSpecification(ASubString);
  Assert.IsTrue(fStringCSStartsWithSpec.IsSatisfiedBy(AString));
end;


initialization
  TDUnitX.RegisterTestFixture(TTestStringCSStartsWith);
end.
