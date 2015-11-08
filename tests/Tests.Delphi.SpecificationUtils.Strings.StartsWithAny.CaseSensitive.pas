unit Tests.Delphi.SpecificationUtils.Strings.StartsWithAny.CaseSensitive;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns,
  Delphi.SpecificationUtils.Strings.CaseSensitive;

type

  [TestFixture]
  TTestStringCSStartsWithAny = class(TObject)
  protected
    fStringCSStartsWithSpec: TSpecification<String>;
    procedure SetupSpecification(const ASubstrings: String);
  public
    [TestCase('test1', 'House;H,a,b', ';')]
    [TestCase('test2', 'House;a,b,Hou', ';')]
    procedure TestStartsWithSubstring(const AString: string; const ASubStrings: string);

    [TestCase('test1', 'House;hou,a,b', ';')]
    [TestCase('test2', 'House;a,b,hou', ';')]
    procedure TestDoesNotStartsWithSubstring(const AString: string; const ASubStrings: string);
  end;

implementation

uses
  System.Classes;

{ TTestStringCSStartsWithAny }

procedure TTestStringCSStartsWithAny.SetupSpecification(const ASubstrings: String);
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
  fStringCSStartsWithSpec := TStringStartsWithAny.Create(LStringArray);
end;

procedure TTestStringCSStartsWithAny.TestDoesNotStartsWithSubstring(const AString,ASubStrings: string);
begin
  SetupSpecification(ASubStrings);
  Assert.IsFalse(fStringCSStartsWithSpec.IsSatisfiedBy(AString));
end;

procedure TTestStringCSStartsWithAny.TestStartsWithSubstring(const AString, ASubStrings: string);
begin
  SetupSpecification(ASubStrings);
  Assert.IsTrue(fStringCSStartsWithSpec.IsSatisfiedBy(AString));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestStringCSStartsWithAny);
end.
