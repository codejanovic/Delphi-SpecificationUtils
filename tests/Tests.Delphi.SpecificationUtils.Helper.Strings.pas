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

    [TestCase('test1', 'pewpewpew;p,e,w;pewpew', ';')]
    [TestCase('test1', 'pewpewpew;P,E,W;pewpew', ';')]
    procedure TestRemoveByArray(const AString: String; const ASubsStrings: String; const AExpectedResult: String);

    [TestCase('test1', 'pewpewpew,pew,pewpew')]
    [TestCase('test1', 'pewpewpew,PEW,pewpewpew')]
    procedure TestRemoveCaseSensitive(const AString: String; const ASubsString: String; const AExpectedResult: String);

    [TestCase('test1', 'pewpewpew;p,e,w;pewpew', ';')]
    [TestCase('test1', 'pewpewpew;P,E,W;pewpewpew', ';')]
    procedure TestRemoveByArrayCaseSensitive(const AString: String; const ASubsStrings: String; const AExpectedResult: String);

    [TestCase('test1', 'pewpewpewpow,pew,pow')]
    [TestCase('test2', 'pewpewpewpow,PEW,pow')]
    [TestCase('test3', 'pewpewpewpow,pow,pewpewpew')]
    [TestCase('test4', 'pewpewpewpow,POW,pewpewpew')]
    procedure TestRemoveAll(const AString: String; const ASubsString: String; const AExpectedResult: String);

    [TestCase('test1', 'pewpewpewpow;p,e,w;o', ';')]
    [TestCase('test2', 'pewpewpewpow;P,E,W;o', ';')]
    [TestCase('test3', 'pewpewpewpow;p,o,w;eee', ';')]
    [TestCase('test4', 'pewpewpewpow;P,O,W;eee', ';')]
    procedure TestRemoveByArrayAll(const AString: String; const ASubsStrings: String; const AExpectedResult: String);

    [TestCase('test1', 'pewpewpewpow,pew,pow')]
    [TestCase('test2', 'pewpewpewpow,PEW,pewpewpewpow')]
    [TestCase('test3', 'pewpewpewpow,pow,pewpewpew')]
    [TestCase('test4', 'pewpewpewpow,POW,pewpewpewpow')]
    procedure TestRemoveAllCaseSensitive(const AString: String; const ASubsString: String; const AExpectedResult: String);

    [TestCase('test1', 'pewpewpewpow;p,e,w;o', ';')]
    [TestCase('test2', 'pewpewpewpow;P,E,W;pewpewpewpow', ';')]
    [TestCase('test3', 'pewpewpewpow;p,o,w;eee', ';')]
    [TestCase('test4', 'pewpewpewpow;P,O,W;pewpewpewpow', ';')]
    procedure TestRemoveByArrayAllCaseSensitive(const AString: String; const ASubsStrings: String; const AExpectedResult: String);

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

    [TestCase('test1', '{6D951AB8-90C8-4E4C-936F-7E2D297813E5}')]
    [TestCase('test2', '6D951AB8-90C8-4E4C-936F-7E2D297813E5}')]
    [TestCase('test3', '{6D951AB8-90C8-4E4C-936F-7E2D297813E5')]
    [TestCase('test4', '6D951AB8-90C8-4E4C-936F-7E2D297813E5')]
    procedure TestIsGUID(const AString: String);

    [TestCase('test1', '{6D951AB8-90C8-4E4C-936F-7E2D297813E5}')]
    [TestCase('test2', '6D951AB8-90C8-4E4C-936F-7E2D297813E5}')]
    [TestCase('test3', '{6D951AB8-90C8-4E4C-936F-7E2D297813E5')]
    [TestCase('test4', '6D951AB8-90C8-4E4C-936F-7E2D297813E5')]
    procedure TestStringToGUID(const AString: String);

    [TestCase('test1', '  trimMe  ,trimMe')]
    procedure TestTrim(const AValue: String; const AExpected: String);
    [TestCase('test1', '  trimMe  ,trimMe  ')]
    procedure TestTrimLeft(const AValue: String; const AExpected: String);
    [TestCase('test1', '  trimMe  ,  trimMe')]
    procedure TestTrimRight(const AValue: String; const AExpected: String);

    [TestCase('test1', 'concat,dont,dontconcat')]
    procedure TestConcatLeft(const AValue: String; const AValueToAdd: string; const AExpected: String);
    [TestCase('test1', 'concat,me,concatme')]
    procedure TestConcatRight(const AValue: String; const AValueToAdd: string; const AExpected: String);

    [TestCase('test1', 'a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a', ';')]
    procedure TestToArrayEqualsSysUtilsArrayCount(const AValues: string);

    [TestCase('test1', 'a,b,c', ';')]
    procedure TestToArrayEqualsSysUtilsArray(const AValues: string);

    [TestCase('test1', 'C:\Test,C:\Test\')]
    [TestCase('test2', 'C:\Test\,C:\Test\')]
    procedure TestIncludeTrailingPathDelimiter(const AValue: string; const AExpected: String);

  end;

implementation

uses
  Tests.Helper.SysUtilsAccess;

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

procedure TTestStringHelper.TestConcatLeft(const AValue, AValueToAdd,
  AExpected: String);
begin
  Assert.AreEqual(AExpected, AValue.ConcatLeft(AValueToAdd));
end;

procedure TTestStringHelper.TestConcatRight(const AValue, AValueToAdd,
  AExpected: String);
begin
  Assert.AreEqual(AExpected, AValue.ConcatRight(AValueToAdd));
end;

procedure TTestStringHelper.TestIncludeTrailingPathDelimiter(const AValue, AExpected: String);
begin
  Assert.AreEqual(AExpected, AValue.IncludeTrailingPathDelimiter);
end;

procedure TTestStringHelper.TestIsBoolean(const AString: String);
begin
  Assert.IsTrue(AString.IsBoolean);
end;

procedure TTestStringHelper.TestIsFloat(const AString: String);
begin
  Assert.IsTrue(AString.IsFloat);
end;

procedure TTestStringHelper.TestIsGUID(const AString: String);
begin
  Assert.IsTrue(AString.IsGUID);
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

procedure TTestStringHelper.TestToArrayEqualsSysUtilsArray(const AValues: string);
var
  LArraySysUtils,
  LArrayMyUtils: TArray<string>;
  I: Integer;
begin
  LArraySysUtils := TSysUtilsHelper.Split(AValues);
  LArrayMyUtils := AValues.ToArray;

  Assert.AreEqual(Length(LArraySysUtils), Length(LArrayMyUtils));
  for I := 0 to Length(LArrayMyUtils) -1 do
    Assert.AreEqual(LArraySysUtils[i], LArrayMyUtils[i]);
end;

procedure TTestStringHelper.TestToArrayEqualsSysUtilsArrayCount(const AValues: string);
var
  LArraySysUtils,
  LArrayMyUtils: TArray<string>;
begin
  LArraySysUtils := TSysUtilsHelper.Split(AValues);
  LArrayMyUtils := AValues.ToArray;

  Assert.AreEqual(Length(LArraySysUtils), Length(LArrayMyUtils));
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

procedure TTestStringHelper.TestRemoveByArray(const AString, ASubsStrings, AExpectedResult: String);
begin
  Assert.AreEqual(AString.Remove(ASubsStrings.ToArray), AExpectedResult);
end;

procedure TTestStringHelper.TestRemoveByArrayAll(const AString, ASubsStrings,
  AExpectedResult: String);
begin
  Assert.AreEqual(AString.RemoveAll(ASubsStrings.ToArray), AExpectedResult);
end;

procedure TTestStringHelper.TestRemoveByArrayAllCaseSensitive(const AString,
  ASubsStrings, AExpectedResult: String);
begin
  Assert.AreEqual(AString.RemoveAllCaseSensitive(ASubsStrings.ToArray), AExpectedResult);
end;

procedure TTestStringHelper.TestRemoveByArrayCaseSensitive(const AString,
  ASubsStrings, AExpectedResult: String);
begin
  Assert.AreEqual(AString.RemoveCaseSensitive(ASubsStrings.ToArray), AExpectedResult);
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

procedure TTestStringHelper.TestStringToGUID(const AString: String);
var
  LGUID: TGUID;
begin
  Assert.IsTrue(AString.TryToGUID(LGUID));
end;

procedure TTestStringHelper.TestTrim(const AValue, AExpected: String);
begin
  Assert.AreEqual(AExpected, AValue.Trim);
end;

procedure TTestStringHelper.TestTrimLeft(const AValue, AExpected: String);
begin
  Assert.AreEqual(AExpected, AValue.TrimLeft);
end;

procedure TTestStringHelper.TestTrimRight(const AValue, AExpected: String);
begin
  Assert.AreEqual(AExpected, AValue.TrimRight);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestStringHelper);
end.
