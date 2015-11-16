unit Tests.Delphi.SpecificationUtils.Reflection.Instance.Inherits;

interface
uses
  DUnitX.TestFramework;

type
  TBook = class(TObject)
  end;
  TAmazonBook = class(TBook)
  end;
  TAmazonEbook = class(TAmazonBook)
  end;


  [TestFixture]
  TTestReflectionInherits = class(TObject)
  protected
    fAmazonBook: TAmazonBook;
    fAmazonEbook: TAmazonEbook;
  public
    [Setup]
    procedure Setup;
    [Teardown]
    procedure Teardown;
    [Test]
    procedure TestAmazonBookInheritsFromBook;
    [Test]
    procedure TestAmazonBookDoesNotInheritFromAmazonEbook;
    [Test]
    procedure TestAmazonEBookInheritsFromAmazonbook;

    [TestCase('1', 'TBook')]
    [TestCase('2', 'TObject')]
    procedure TestAmazonBookInheritsFrom(const AClassname: String);
    [TestCase('1', 'TAmazonEbook')]
    procedure TestAmazonBookInheritsNotFrom(const AClassname: String);
    [TestCase('1', 'TBook')]
    [TestCase('2', 'TObject')]
    [TestCase('3', 'TAmazonBook')]
    procedure TestAmazonEbookInheritsFrom(const AClassname: String);
    [TestCase('1', 'TTestClass')]
    procedure TestAmazonEbookInheritsNotFrom(const AClassname: String);
  end;




implementation

uses
  Delphi.SpecificationUtils.Reflection.Instance,
  Spring.DesignPatterns, Delphi.SpecificationUtils.Strings.IgnoreCase;


{ TTestReflectionTObject }

procedure TTestReflectionInherits.Setup;
begin
  fAmazonBook := TAmazonBook.Create;
  fAmazonEbook := TAmazonEbook.Create;
end;

procedure TTestReflectionInherits.Teardown;
begin
  fAmazonBook.Free;
  fAmazonEbook.Free;
end;

procedure TTestReflectionInherits.TestAmazonBookDoesNotInheritFromAmazonEbook;
var
  LInheritsFrom: ISpecification<TObject>;
begin
  LInheritsFrom := TObjectInheritsFrom.Create(TAmazonEbook);
  Assert.IsFalse(LInheritsFrom.IsSatisfiedBy(fAmazonBook));
end;


procedure TTestReflectionInherits.TestAmazonBookInheritsFrom(const AClassname: String);
var
  LEqualsIgnoreCase: ISpecification<String>;
  LInheritsFromByName: ISpecification<TObject>;
begin
  LEqualsIgnoreCase := TStringEqualsIgnoreCase.Create(AClassName);
  LInheritsFromByName := TObjectInheritsFromByName.Create(LEqualsIgnoreCase);
  Assert.IsTrue(LInheritsFromByName.IsSatisfiedBy(fAmazonBook));
end;

procedure TTestReflectionInherits.TestAmazonBookInheritsFromBook;
var
  LInheritsFrom: ISpecification<TObject>;
begin
  LInheritsFrom := TObjectInheritsFrom.Create(TBook);
  Assert.IsTrue(LInheritsFrom.IsSatisfiedBy(fAmazonBook));
end;

procedure TTestReflectionInherits.TestAmazonBookInheritsNotFrom(const AClassname: String);
var
  LEqualsIgnoreCase: ISpecification<String>;
  LInheritsFromByName: ISpecification<TObject>;
begin
  LEqualsIgnoreCase := TStringEqualsIgnoreCase.Create(AClassName);
  LInheritsFromByName := TObjectInheritsFromByName.Create(LEqualsIgnoreCase);
  Assert.IsFalse(LInheritsFromByName.IsSatisfiedBy(fAmazonBook));
end;

procedure TTestReflectionInherits.TestAmazonEbookInheritsFrom(const AClassname: String);
var
  LEqualsIgnoreCase: ISpecification<String>;
  LInheritsFromByName: ISpecification<TObject>;
begin
  LEqualsIgnoreCase := TStringEqualsIgnoreCase.Create(AClassName);
  LInheritsFromByName := TObjectInheritsFromByName.Create(LEqualsIgnoreCase);
  Assert.IsTrue(LInheritsFromByName.IsSatisfiedBy(fAmazonEbook));
end;

procedure TTestReflectionInherits.TestAmazonEBookInheritsFromAmazonbook;
var
  LInheritsFrom: ISpecification<TObject>;
begin
  LInheritsFrom := TObjectInheritsFrom.Create(TAmazonBook);
  Assert.IsTrue(LInheritsFrom.IsSatisfiedBy(fAmazonEbook));
end;


procedure TTestReflectionInherits.TestAmazonEbookInheritsNotFrom(const AClassname: String);
var
  LEqualsIgnoreCase: ISpecification<String>;
  LInheritsFromByName: ISpecification<TObject>;
begin
  LEqualsIgnoreCase := TStringEqualsIgnoreCase.Create(AClassName);
  LInheritsFromByName := TObjectInheritsFromByName.Create(LEqualsIgnoreCase);
  Assert.IsFalse(LInheritsFromByName.IsSatisfiedBy(fAmazonEbook));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestReflectionInherits);
end.
