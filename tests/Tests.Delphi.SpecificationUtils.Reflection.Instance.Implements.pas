unit Tests.Delphi.SpecificationUtils.Reflection.Instance.Implements;

interface
uses
  DUnitX.TestFramework;

type
  IBook = interface
    ['{7484D309-7072-4F88-A485-26E41C3A4315}']
  end;
  IAmazonBook = interface(IBook)
    ['{75C414EB-C6A1-45DF-8C1C-186EACBC76B0}']
  end;
  IAmazonEbook = interface(IBook)
    ['{5445674C-92F5-4CA8-83D8-C46870894C03}']
  end;
  IGenericBook<T> = interface(IBook)
    ['{02C63AA7-DD69-4C07-8701-97BC568D2B02}']
  end;

  TBook = class(TInterfacedObject, IBook)
  end;
  TAmazonBook = class(TBook, IAmazonBook)
  end;
  TAmazonEbook = class(TAmazonBook, IAmazonEbook)
  end;
  TGenericBook<T> = class(TBook, IGenericBook<T>)
  end;



  [TestFixture]
  TTestReflectionImplements = class(TObject)
  protected
    fAmazonBook: IAmazonBook;
    fAmazonEbook: IAmazonEbook;
    fGenericBook: IGenericBook<String>;
  public
    [Setup]
    procedure Setup;

    [TestCase('1', 'IBook')]
    [TestCase('2', 'IInterface')]
    [TestCase('3', 'IAmazonbook')]
    procedure TestAmazonBookImplements(const AClassname: String);
    [TestCase('1', 'IAmazonEbook')]
    procedure TestAmazonBookDoesNotImplement(const AClassname: String);
    [TestCase('1', 'IBook')]
    [TestCase('2', 'IAmazonBook')]
    [TestCase('3', 'IAmazonEbook')]
    procedure TestAmazonEbookImplements(const AClassname: String);
    [TestCase('1', 'ITestClass')]
    procedure TestAmazonEbookDoesNotImplement(const AClassname: String);
    [TestCase('1', 'IBook')]
    [TestCase('2', 'IInterface')]
    [TestCase('3', 'IGenericBook<System.String>')]
    procedure TestGenericBookImplements(const AClassName: String);
  end;

  [TestFixture]
  TTestReflectionInstanceImplements = class(TObject) 
  public
  end;

implementation

uses
  Delphi.SpecificationUtils.Reflection.Instance, Spring.DesignPatterns, Delphi.SpecificationUtils.Strings.IgnoreCase;


{ TTestReflectionImplements }

procedure TTestReflectionImplements.Setup;
begin
  fAmazonBook := TAmazonBook.Create;
  fAmazonEbook := TAmazonEbook.Create;
  fGenericBook := TGenericBook<String>.Create;
end;

procedure TTestReflectionImplements.TestAmazonBookDoesNotImplement(const AClassname: String);
var
  LEqualsIgnoreCase: ISpecification<String>;
  LImplements: ISpecification<IInterface>;
begin
  LEqualsIgnoreCase := TStringEqualsIgnoreCase.Create(AClassname);
  LImplements := TInterfacedObjectImplementsByName.Create(LEqualsIgnoreCase);

  Assert.IsFalse(LImplements.IsSatisfiedBy(fAmazonBook));
end;


procedure TTestReflectionImplements.TestAmazonBookImplements(const AClassname: String);
var
  LEqualsIgnoreCase: ISpecification<String>;
  LImplements: ISpecification<IInterface>;
begin
  LEqualsIgnoreCase := TStringEqualsIgnoreCase.Create(AClassname);
  LImplements := TInterfacedObjectImplementsByName.Create(LEqualsIgnoreCase);

  Assert.IsTrue(LImplements.IsSatisfiedBy(fAmazonBook));
end;


procedure TTestReflectionImplements.TestAmazonEbookDoesNotImplement(const AClassname: String);
var
  LEqualsIgnoreCase: ISpecification<String>;
  LImplements: ISpecification<IInterface>;
begin
  LEqualsIgnoreCase := TStringEqualsIgnoreCase.Create(AClassname);
  LImplements := TInterfacedObjectImplementsByName.Create(LEqualsIgnoreCase);

  Assert.IsFalse(LImplements.IsSatisfiedBy(fAmazonEbook));
end;

procedure TTestReflectionImplements.TestAmazonEbookImplements(const AClassname: String);
var
  LEqualsIgnoreCase: ISpecification<String>;
  LImplements: ISpecification<IInterface>;
begin
  LEqualsIgnoreCase := TStringEqualsIgnoreCase.Create(AClassname);
  LImplements := TInterfacedObjectImplementsByName.Create(LEqualsIgnoreCase);

  Assert.IsTrue(LImplements.IsSatisfiedBy(fAmazonEbook));
end;


procedure TTestReflectionImplements.TestGenericBookImplements(const AClassName: String);
var
  LEqualsIgnoreCase: ISpecification<String>;
  LImplements: ISpecification<IInterface>;
begin
  LEqualsIgnoreCase := TStringEqualsIgnoreCase.Create(AClassname);
  LImplements := TInterfacedObjectImplementsByName.Create(LEqualsIgnoreCase);

  Assert.IsTrue(LImplements.IsSatisfiedBy(fGenericBook));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestReflectionInstanceImplements);
end.
