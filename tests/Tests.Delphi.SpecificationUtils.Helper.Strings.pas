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

    [TestCase('test1', 'pewpewpew,pew,pewpew')]
    [TestCase('test1', 'pewpewpew,PEW,pewpew')]
    procedure TestRemove(const AString: String; const ASubsString: String; const AExpectedResult: String);

    [TestCase('test1', 'pewpewpew,pew,pewpew')]
    [TestCase('test1', 'pewpewpew,PEW,pewpewpew')]
    procedure TestRemoveCaseSensitive(const AString: String; const ASubsString: String; const AExpectedResult: String);

    [TestCase('test1', 'pewpewpewpow,pew,pow')]
    [TestCase('test2', 'pewpewpewpow,PEW,pow')]
    [TestCase('test3', 'pewpewpewpow,pow,pewpewpew')]
    [TestCase('test4', 'pewpewpewpow,POW,pewpewpew')]
    procedure TestRemoveAll(const AString: String; const ASubsString: String; const AExpectedResult: String);

    [TestCase('test1', 'pewpewpewpow,pew,pow')]
    [TestCase('test2', 'pewpewpewpow,PEW,pewpewpewpow')]
    [TestCase('test3', 'pewpewpewpow,pow,pewpewpew')]
    [TestCase('test4', 'pewpewpewpow,POW,pewpewpewpow')]
    procedure TestRemoveAllCaseSensitive(const AString: String; const ASubsString: String; const AExpectedResult: String);

    [TestCase('test1', 'Pew pew Pew pow,([A-Z])\w+, pew  pow')]
    procedure TestRemoveByRegex(const AString: String; const AExpression: String; const AExpectedResult: String);

    [TestCase('test1', 'Pew pew Pew pow,([A-Z])\w+,pow,pow pew pow pow')]
    procedure TestReplaceByRegex(const AString: String; const AExpression: String; const ANewValue: String; const AExpectedResult: String);

    [TestCase('test1', 'true')]
    [TestCase('test2', 'false')]
    [TestCase('test3', 'False')]
    [TestCase('test4', 'TRue')]
    procedure TestIsBoolean(const AString: String);

    [TestCase('test1', '0')]
    [TestCase('test2', '1')]
    [TestCase('test3', '-1')]
    procedure TestIsNotBoolean(const AString: String);

    [TestCase('test1', '1')]
    [TestCase('test2', '-1')]
    [TestCase('test3', '+1')]
    [TestCase('test4', '1.0')]
    [TestCase('test5', '-1.0')]
    [TestCase('test6', '+1.0')]
    procedure TestIsFloat(const AString: String);

    [TestCase('test1', '1.0.0')]
    [TestCase('test2', '--1')]
    [TestCase('test3', '++1')]
    [TestCase('test4', '1,0', ';')]
    [TestCase('test5', '-1.0e')]
    [TestCase('test6', 'true')]
    procedure TestIsNotFloat(const AString: String);

    [TestCase('test1', '0')]
    [TestCase('test2', '1')]
    [TestCase('test3', '-1')]
    [TestCase('test4', '+1')]
    [TestCase('test4', '1000')]
    [TestCase('test4', '999999')]
    procedure TestIsInteger(const AString: String);

    [TestCase('test1', '1.0.0')]
    [TestCase('test2', '--1')]
    [TestCase('test3', '++1')]
    [TestCase('test4', '1,0', ';')]
    [TestCase('test5', '-1.0e')]
    [TestCase('test6', 'true')]
    [TestCase('test7', '1.0')]
    [TestCase('test8', '-1.0')]
    [TestCase('test9', '+1.0')]
    [TestCase('test10', '--1')]
    [TestCase('test11', '++1')]
    procedure TestIsNotInteger(const AString: String);


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

procedure TTestStringHelper.TestIsBoolean(const AString: String);
begin
  Assert.IsTrue(AString.IsBoolean);
end;

procedure TTestStringHelper.TestIsFloat(const AString: String);
begin
  Assert.IsTrue(AString.IsFloat);
end;

procedure TTestStringHelper.TestIsInteger(const AString: String);
begin
  Assert.IsTrue(AString.IsInteger);
end;

procedure TTestStringHelper.TestIsNotBoolean(const AString: String);
begin
  Assert.IsFalse(AString.IsBoolean);
end;

procedure TTestStringHelper.TestIsNotFloat(const AString: String);
begin
  Assert.IsFalse(AString.IsFloat);
end;

procedure TTestStringHelper.TestIsNotInteger(const AString: String);
begin
  Assert.IsFalse(AString.IsInteger);
end;

procedure TTestStringHelper.TestRemove(const AString, ASubsString, AExpectedResult: String);
var
  LResult: String;
begin
  LResult := AString.Remove(ASubsString);
  Assert.AreEqual(AExpectedResult, LResult);
end;

procedure TTestStringHelper.TestRemoveAll(const AString, ASubsString, AExpectedResult: String);
var
  LResult: String;
begin
  LResult := AString.RemoveAll(ASubsString);
  Assert.AreEqual(AExpectedResult, LResult);
end;

procedure TTestStringHelper.TestRemoveAllCaseSensitive(const AString, ASubsString, AExpectedResult: String);
var
  LResult: String;
begin
  LResult := AString.RemoveAllCaseSensitive(ASubsString);
  Assert.AreEqual(AExpectedResult, LResult);
end;

procedure TTestStringHelper.TestRemoveByRegex(const AString, AExpression, AExpectedResult: String);
var
  LResult: String;
begin
  LResult := AString.RemoveByRegex(AExpression);
  Assert.AreEqual(AExpectedResult, LResult);
end;

procedure TTestStringHelper.TestRemoveCaseSensitive(const AString, ASubsString, AExpectedResult: String);
var
  LResult: String;
begin
  LResult := AString.RemoveCaseSensitive(ASubsString);
  Assert.AreEqual(AExpectedResult, LResult);
end;

procedure TTestStringHelper.TestReplaceByRegex(const AString, AExpression, ANewValue, AExpectedResult: String);
var
  LResult: String;
begin
  LResult := AString.ReplaceByRegex(AExpression, ANewValue);
  Assert.AreEqual(AExpectedResult, LResult);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestStringHelper);
end.
