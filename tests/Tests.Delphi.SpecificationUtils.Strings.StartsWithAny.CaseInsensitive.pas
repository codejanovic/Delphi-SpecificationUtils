unit Tests.Delphi.SpecificationUtils.Strings.StartsWithAny.CaseInsensitive;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns, Delphi.SpecificationUtils,
  Delphi.SpecificationUtils.Strings.CaseInsensitive;

type

  [TestFixture]
  TTestStringCIStartsWithAny = class(TObject)
  protected
    fStringCIStartsWithSpec: TSpecification<String>;
    procedure SetupSpecification(const ASubstrings: String);
  public
    [TestCase('test1', 'House;H,a,b', ';')]
    [TestCase('test2', 'House;h,a,b', ';')]
    [TestCase('test2', 'House;a,b,Hou', ';')]
    [TestCase('test2', 'House;a,b,hou', ';')]
    procedure TestStartsWithSubstring(const AString: string; const ASubStrings: string);

    [TestCase('test1', 'House;a,b', ';')]
    [TestCase('test2', 'House;a,b,cat,dog', ';')]
    procedure TestDoesNotStartsWithSubstring(const AString: string; const ASubStrings: string);
  end;

implementation

uses
  System.Classes;

{ TTestStringCIStartsWithAny }

procedure TTestStringCIStartsWithAny.SetupSpecification(const ASubstrings: String);
var
  LStringArray: TArray<string>;
  LStringList: TStringList;
  I: Integer;
begin
  LStringList := TStringList.Create;
  try
    LStringList.CommaText := ASubstrings;
    for I := 0 to LStringList.Count -1 do
      Insert(LStringList.Strings[i], LStringArray, i);
  finally
    LStringList.Free;
  end;
  fStringCIStartsWithSpec := TStringCIStartsWithAny.Create(LStringArray);
end;

procedure TTestStringCIStartsWithAny.TestDoesNotStartsWithSubstring(const AString,ASubStrings: string);
begin
  SetupSpecification(ASubStrings);
  Assert.IsFalse(fStringCIStartsWithSpec.IsSatisfiedBy(AString));
end;

procedure TTestStringCIStartsWithAny.TestStartsWithSubstring(const AString, ASubStrings: string);
begin
  SetupSpecification(ASubStrings);
  Assert.IsTrue(fStringCIStartsWithSpec.IsSatisfiedBy(AString));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestStringCIStartsWithAny);
end.
