unit Tests.Delphi.SpecificationUtils.Strings.EndsWithAny.CaseSensitive;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns,
  Delphi.SpecificationUtils.Strings.CaseSensitive;

type

  [TestFixture]
  TTestStringCSEndsWithAny = class(TObject)
  protected
    fStringCSEndsWithSpec: TSpecification<String>;
    procedure SetupSpecification(const ASubstrings: String);
  public
    [TestCase('test1', 'House;e,a,b', ';')]
    [TestCase('test2', 'House;use,b,Hou', ';')]
    procedure TestEndsWithSubstring(const AString: string; const ASubStrings: string);

    [TestCase('test1', 'House;hou,a,b', ';')]
    [TestCase('test2', 'House;a,b,usE', ';')]
    procedure TestDoesNotEndsWithSubstring(const AString: string; const ASubStrings: string);
  end;

implementation

uses
  System.Classes;

{ TTestStringCSEndsWithAny }

procedure TTestStringCSEndsWithAny.SetupSpecification(const ASubstrings: String);
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
  fStringCSEndsWithSpec := TStringEndsWithAny.Create(LStringArray);
end;

procedure TTestStringCSEndsWithAny.TestDoesNotEndsWithSubstring(const AString,ASubStrings: string);
begin
  SetupSpecification(ASubStrings);
  Assert.IsFalse(fStringCSEndsWithSpec.IsSatisfiedBy(AString));
end;

procedure TTestStringCSEndsWithAny.TestEndsWithSubstring(const AString, ASubStrings: string);
begin
  SetupSpecification(ASubStrings);
  Assert.IsTrue(fStringCSEndsWithSpec.IsSatisfiedBy(AString));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestStringCSEndsWithAny);
end.
