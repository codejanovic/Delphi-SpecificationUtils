unit Tests.Delphi.SpecificationUtils.Helper.Strings;

interface
uses
  DUnitX.TestFramework,
  Delphi.SpecificationUtils.Helper.Strings;

type

  [TestFixture]
  TTestStringHelper = class(TObject)
  public
    [TestCase('test1', 'House')]
    procedure TestCharactersCount(const AString: String);
    [TestCase('test1', 'House')]
    procedure TestCharactersArrayIsCorrect(const AString: String);
  end;

implementation

{ TTestStringHelper }

procedure TTestStringHelper.TestCharactersArrayIsCorrect(const AString: String);
var
  LCharacter: Char;
  LCharacters: TArray<Char>;
  LCharactersToString: String;
begin
  LCharacters := AString.Characters;
  for LCharacter in LCharacters do
    LCharactersToString := LCharactersToString + LCharacter;

  Assert.AreEqual(AString, LCharactersToString);
end;

procedure TTestStringHelper.TestCharactersCount(const AString: String);
begin
  Assert.AreEqual(AString.Length, Length(AString.Characters));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestStringHelper);
end.
