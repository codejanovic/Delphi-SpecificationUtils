unit Tests.Delphi.SpecificationUtils.Strings.EndsWithAny.CaseInsensitive;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns, Delphi.SpecificationUtils,
  Delphi.SpecificationUtils.Strings.IgnoreCase;

type

  [TestFixture]
  TTestStringCIEndsWithAny = class(TObject)
  protected
    fStringCIEndsWithSpec: TSpecification<String>;
    procedure SetupSpecification(const ASubstrings: String);
  public
    [TestCase('test1', 'House;e,a,b', ';')]
    [TestCase('test2', 'House;E,a,b', ';')]
    [TestCase('test3', 'House;use,b,Hou', ';')]
    [TestCase('test4', 'House;uSe,b,Hou', ';')]
    procedure TestEndsWithSubstring(const AString: string; const ASubStrings: string);

    [TestCase('test1', 'House;hou,a,b', ';')]
    [TestCase('test2', 'House;a,b,cat,dog', ';')]
    procedure TestDoesNotEndsWithSubstring(const AString: string; const ASubStrings: string);
  end;

implementation

uses
  System.Classes;

{ TTestStringCIEndsWithAny }

procedure TTestStringCIEndsWithAny.SetupSpecification(const ASubstrings: String);
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
  fStringCIEndsWithSpec := TStringEndsWithAnyIgnoreCase.Create(LStringArray);
end;

procedure TTestStringCIEndsWithAny.TestDoesNotEndsWithSubstring(const AString,ASubStrings: string);
begin
  SetupSpecification(ASubStrings);
  Assert.IsFalse(fStringCIEndsWithSpec.IsSatisfiedBy(AString));
end;

procedure TTestStringCIEndsWithAny.TestEndsWithSubstring(const AString, ASubStrings: string);
begin
  SetupSpecification(ASubStrings);
  Assert.IsTrue(fStringCIEndsWithSpec.IsSatisfiedBy(AString));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestStringCIEndsWithAny);
end.
