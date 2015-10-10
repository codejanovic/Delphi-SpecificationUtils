unit Tests.Delphi.SpecificationUtils.Strings.ContainsAny.CaseInsensitive;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns, Delphi.SpecificationUtils, Delphi.SpecificationUtils.Strings.CaseInsensitive;

type

  [TestFixture]
  TTestStringContaintAnyCaseInsensitive = class(TObject)
  protected
    fStringCaseInsensitiveContainsAnySpec: TSpecification<String>;
    procedure SetupSpecification(const ASubstring: String);
  public
    [TestCase('test1', 'House;h', ';')]
    [TestCase('test2', 'House;h,a,b', ';')]
    [TestCase('test3', 'House;h,O,b', ';')]
    [TestCase('test4', 'House;house,cat,dog', ';')]
    [TestCase('test4', 'House;House,cat,dog', ';')]
    procedure TestContainsAny(const AString: string; const ASubStrings: string);
    [TestCase('test1', 'House;a,b', ';')]
    [TestCase('test3', 'House;cat,dog', ';')]
    [TestCase('test3', 'House;cat', ';')]
    procedure TestNotContainsAny(const AString: string; const ASubStrings: string);
  end;

implementation

uses
  System.Classes,
  Spring.Collections;


{ TTestStringContaintAnyCaseInsensitive }

procedure TTestStringContaintAnyCaseInsensitive.SetupSpecification(const ASubstring: String);
var
  LStringArray: TArray<string>;
  LStringList: TStringList;
  LString: String;
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

  fStringCaseInsensitiveContainsAnySpec := TStringCIContainsAny.Create(LStringArray);
end;

procedure TTestStringContaintAnyCaseInsensitive.TestContainsAny(const AString, ASubStrings: string);
begin
  SetupSpecification(ASubStrings);
  Assert.IsTrue(fStringCaseInsensitiveContainsAnySpec.IsSatisfiedBy(AString));
end;

procedure TTestStringContaintAnyCaseInsensitive.TestNotContainsAny(const AString, ASubStrings: string);
begin
  SetupSpecification(ASubStrings);
  Assert.IsFalse(fStringCaseInsensitiveContainsAnySpec.IsSatisfiedBy(AString));
end;


initialization
  TDUnitX.RegisterTestFixture(TTestStringContaintAnyCaseInsensitive);
end.
