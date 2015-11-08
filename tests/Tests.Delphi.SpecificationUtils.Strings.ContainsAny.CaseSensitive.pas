unit Tests.Delphi.SpecificationUtils.Strings.ContainsAny.CaseSensitive;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns, Delphi.SpecificationUtils.Strings.CaseSensitive;

type

  [TestFixture]
  TTestStringContainsAnyCaseSensitive = class(TObject)
   protected
    fStringCaseSensitiveContainsAnySpec: TSpecification<String>;
    procedure SetupSpecification(const ASubstring: String);
  public
    [TestCase('test1', 'House;H', ';')]
    [TestCase('test2', 'House;H,a,b', ';')]
    [TestCase('test3', 'House;h,o,b', ';')]
    procedure TestContainsAny(const AString: string; const ASubStrings: string);
    [TestCase('test1', 'House;a,b', ';')]
    [TestCase('test2', 'House;a,b,O', ';')]
    [TestCase('test3', 'House;cat,dog,house', ';')]
    [TestCase('test3', 'House;cat', ';')]
    procedure TestNotContainsAny(const AString: string; const ASubStrings: string);
  end;

implementation

uses
  System.Classes;


{ TTestStringContainsAnyCaseSensitive }

procedure TTestStringContainsAnyCaseSensitive.SetupSpecification(const ASubstring: String);
var
  LStringArray: TArray<String>;
  LStringList: TStringList;
  I: Integer;
begin
  LStringList := TStringList.Create;
  try
    LStringList.CommaText := ASubstring;
    for I := 0 to LStringList.Count -1 do
      Insert(LStringList.Strings[i], LStringArray, i);
  finally
    LStringList.Free;
  end;

  fStringCaseSensitiveContainsAnySpec := TStringContainsAny.Create(LStringArray);
end;

procedure TTestStringContainsAnyCaseSensitive.TestContainsAny(const AString, ASubStrings: string);
begin
  SetupSpecification(ASubStrings);
  Assert.IsTrue(fStringCaseSensitiveContainsAnySpec.IsSatisfiedBy(AString));
end;

procedure TTestStringContainsAnyCaseSensitive.TestNotContainsAny(const AString, ASubStrings: string);
begin
  SetupSpecification(ASubStrings);
  Assert.IsFalse(fStringCaseSensitiveContainsAnySpec.IsSatisfiedBy(AString));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestStringContainsAnyCaseSensitive);
end.
