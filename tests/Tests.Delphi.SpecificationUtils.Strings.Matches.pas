unit Tests.Delphi.SpecificationUtils.Strings.Matches;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  TTestStringMatches = class(TObject) 
  public

    [TestCase('1', 'Teststring,string$,true')]
    [TestCase('2', 'Teststring,String$,false')]
    procedure TestMatches(const AValue: String; const ARegex: String; const AExpected: boolean);

    [TestCase('1', 'Teststring,string$,true')]
    [TestCase('2', 'Teststring,String$,true')]
    [TestCase('2', 'Teststring,test$,false')]
    procedure TestMatchesIgnoreCase(const AValue: String; const ARegex: String; const AExpected: boolean);

    [TestCase('1', 'Teststring,string$,true')]
    [TestCase('2', 'Teststring,String$,true')]
    [TestCase('2', 'Teststring,test$,false')]
    procedure TestMatchesWithRegexOptionIgnoreCase(const AValue: String; const ARegex: String; const AExpected: boolean);

    [TestCase('1', 'Teststring,string$,true')]
    [TestCase('2', 'Teststring,String$,false')]
    procedure TestMatchesWithoutRegexOptions(const AValue: String; const ARegex: String; const AExpected: boolean);
  end;

implementation

uses
  Delphi.SpecificationUtils.Helper.Strings, System.RegularExpressions;


{ TTestStringMatches }

procedure TTestStringMatches.TestMatches(const AValue, ARegex: String;
  const AExpected: boolean);
begin
  Assert.AreEqual(AExpected, AValue.Matches(ARegex));
end;

procedure TTestStringMatches.TestMatchesIgnoreCase(const AValue, ARegex: String;
  const AExpected: boolean);
begin
  Assert.AreEqual(AExpected, AValue.MatchesIgnoreCase(ARegex));
end;

procedure TTestStringMatches.TestMatchesWithoutRegexOptions(const AValue,
  ARegex: String; const AExpected: boolean);
begin
  Assert.AreEqual(AExpected, AValue.Matches(ARegex, [roNone]));
end;

procedure TTestStringMatches.TestMatchesWithRegexOptionIgnoreCase(const AValue,
  ARegex: String; const AExpected: boolean);
begin
  Assert.AreEqual(AExpected, AValue.Matches(ARegex, [roIgnoreCase]));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestStringMatches);
end.
