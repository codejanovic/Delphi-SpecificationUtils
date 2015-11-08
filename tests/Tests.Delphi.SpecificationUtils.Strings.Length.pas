unit Tests.Delphi.SpecificationUtils.Strings.Length;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns,
  Delphi.SpecificationUtils.Strings;

type

  [TestFixture]
  TTestStringLength = class(TObject)
  protected
    fStringHasLengthSpec: TSpecification<String>;
    fStringHasLengthGreatherThanSpec: TSpecification<String>;
    fStringHasLengthLessThanSpec: TSpecification<String>;
    procedure SetupHasLength(const AValue: Integer);
    procedure SetupHasLengthGreatherThan(const AValue: Integer);
    procedure SetupHasLengthLessThan(const AValue: Integer);
  public
    [TestCase('test1', 'one,3')]
    [TestCase('test2', 'two,3')]
    [TestCase('test3', 'three,5')]
    [TestCase('test4', 'one two,7')]
    procedure TestHasLength(const AString: string; const ALength: Integer);
    [TestCase('test1', 'one,0')]
    [TestCase('test2', 'two,5')]
    [TestCase('test3', 'three,10')]
    procedure TestHasNotLength(const AString: string; const ALength: Integer);
    [TestCase('test1', 'one,0')]
    [TestCase('test2', 'one,1')]
    [TestCase('test3', 'one,2')]
    procedure TestHasLengthGreatherThan(const AString: string; const ALength: Integer);
    [TestCase('test1', 'one,3')]
    [TestCase('test2', 'one,4')]
    [TestCase('test3', 'one,5')]
    procedure TestHasNotLengthGreatherThan(const AString: string; const ALength: Integer);
    [TestCase('test1', 'one,4')]
    [TestCase('test2', 'one,5')]
    [TestCase('test3', 'one,6')]
    procedure TestHasLengthLessThan(const AString: string; const ALength: Integer);
    [TestCase('test1', 'one,3')]
    [TestCase('test2', 'one,2')]
    [TestCase('test3', 'one,1')]
    procedure TestHasNotLengthLessThan(const AString: string; const ALength: Integer);
  end;

implementation


{ TTestStringLength }

procedure TTestStringLength.SetupHasLength(const AValue: Integer);
begin
  fStringHasLengthSpec := TStringHasLength.Create(AValue);
end;

procedure TTestStringLength.SetupHasLengthGreatherThan(const AValue: Integer);
begin
  fStringHasLengthGreatherThanSpec := TStringHasLengthGreatherThan.Create(AValue);
end;

procedure TTestStringLength.SetupHasLengthLessThan(const AValue: Integer);
begin
  fStringHasLengthLessThanSpec := TStringHasLengthLessThan.Create(AValue);
end;

procedure TTestStringLength.TestHasLength(const AString: string;
  const ALength: Integer);
begin
  SetupHasLength(ALength);
  Assert.IsTrue(fStringHasLengthSpec.IsSatisfiedBy(AString));
end;

procedure TTestStringLength.TestHasLengthGreatherThan(const AString: string;
  const ALength: Integer);
begin
  SetupHasLengthGreatherThan(ALength);
  Assert.IsTrue(fStringHasLengthGreatherThanSpec.IsSatisfiedBy(AString));
end;

procedure TTestStringLength.TestHasLengthLessThan(const AString: string;
  const ALength: Integer);
begin
  SetupHasLengthLessThan(ALength);
  Assert.IsTrue(fStringHasLengthLessThanSpec.IsSatisfiedBy(AString));
end;

procedure TTestStringLength.TestHasNotLength(const AString: string;
  const ALength: Integer);
begin
  SetupHasLength(ALength);
  Assert.IsFalse(fStringHasLengthSpec.IsSatisfiedBy(AString));
end;

procedure TTestStringLength.TestHasNotLengthGreatherThan(const AString: string;
  const ALength: Integer);
begin
  SetupHasLengthGreatherThan(ALength);
  Assert.IsFalse(fStringHasLengthGreatherThanSpec.IsSatisfiedBy(AString));
end;

procedure TTestStringLength.TestHasNotLengthLessThan(const AString: string;
  const ALength: Integer);
begin
  SetupHasLengthLessThan(ALength);
  Assert.IsFalse(fStringHasLengthLessThanSpec.IsSatisfiedBy(AString));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestStringLength);
end.

