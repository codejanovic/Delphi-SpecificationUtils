unit Tests.Delphi.SpecificationUtils.Strings.EqualsAny.CaseSensitive;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns, Delphi.SpecificationUtils, Delphi.SpecificationUtils.Strings.CaseSensitive;

type

  [TestFixture]
  TTestStringEqualsAnyCasenSensitive = class(TObject) 
    protected
    fStringEqualsAnyCaseSensitiveSpec: TSpecification<String>;
    procedure SetupSpecification(const AStringsToEqual: String);
  public
    [TestCase('test1','House;House,cat,dog', ';')]
    [TestCase('test2','House;House', ';')]
    [TestCase('test3','House;House,cat,dog,House', ';')]
    procedure TestLeftEqualsAnyOfRight(const ALeft: String; const ARights: String);
    [TestCase('test1','House;house,cat,dog', ';')]
    [TestCase('test2','House;house', ';')]
    [TestCase('test3','House;house,cat,dog,house', ';')]
    procedure TestLeftNotEqualsAnyOfRight(const ALeft: String; const ARights: String);
  end;

implementation

uses
  System.Classes;

procedure TTestStringEqualsAnyCasenSensitive.SetupSpecification(const AStringsToEqual: String);
var
  LStringArray: TStringArray;
  LStringList: TStringList;
  LString: String;
  I: Integer;
begin
  LStringList := TStringList.Create;
  try
    LStringList.CommaText := AStringsToEqual;
    for I := 0 to LStringList.Count -1 do
      Insert(LStringList.Strings[i], LStringArray, i);
  finally
    LStringList.Free;
  end;
  fStringEqualsAnyCaseSensitiveSpec := TStringCSEqualsAny.Create(LStringArray);
end;

procedure TTestStringEqualsAnyCasenSensitive.TestLeftEqualsAnyOfRight(const ALeft,ARights: String);
begin
  SetupSpecification(ARights);
  Assert.IsTrue(fStringEqualsAnyCaseSensitiveSpec.IsSatisfiedBy(ALeft));
end;

procedure TTestStringEqualsAnyCasenSensitive.TestLeftNotEqualsAnyOfRight(const ALeft, ARights: String);
begin
  SetupSpecification(ARights);
  Assert.IsFalse(fStringEqualsAnyCaseSensitiveSpec.IsSatisfiedBy(ALeft));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestStringEqualsAnyCasenSensitive);
end.
