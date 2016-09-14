unit Tests.Delphi.SpecificationUtils.RttiType;

interface

uses
  DUnitX.TestFramework,
  Spring.DesignPatterns,
  System.Rtti;

type

  [TestFixture]
  TTestRttiType = class(TObject)
  protected
    fNameSpecification: ISpecification<String>;
    fHasMember: ISpecification<TRttiType>;
    fHasProperty: ISpecification<TRttiType>;
    fHasField: ISpecification<TRttiType>;
    fHasMethod: ISpecification<TRttiType>;
    fInterfacedObject: IInterface;
    fInterfacedObjectRttiType: TRttiType;
  public
    [Setup]
    procedure Setup;

    [TestCase('1.field','FRefCount')]
    [TestCase('2.property','RefCount')]
    [TestCase('3.method','AfterConstruction')]
    procedure TestHasMember(const AName: String);

    [TestCase('1','xyz')]
    procedure TestNotHasMember(const AName: String);

    [TestCase('1','RefCount')]
    procedure TestHasProperty(const AName: String);
    [TestCase('1','xyz')]
    procedure TestNotHasProperty(const AName: String);

    [TestCase('1','AfterConstruction')]
    [TestCase('2','NewInstance')]
    [TestCase('3','ClassName')]
    procedure TestHasMethod(const AName: String);

    [TestCase('1','xyz')]
    procedure TestNotHasMethod(const AName: String);

    [TestCase('1','FRefCount')]
    procedure TestHasField(const AName: String);
    [TestCase('1','xyz')]
    procedure TestNotHasField(const AName: String);

  end;

implementation

uses
  Delphi.SpecificationUtils.Helper.TObject,
  Delphi.SpecificationUtils.Reflection.TRttiType,
  Delphi.SpecificationUtils.Strings.IgnoreCase;


{ TTestRttiType }

procedure TTestRttiType.Setup;
var
  LObject: TObject;
begin
  fInterfacedObject := TinterfacedObject.Create;
  LObject := fInterfacedObject AS TObject;
  fInterfacedObjectRttiType := LObject.GetType;
end;

procedure TTestRttiType.TestHasField(const AName: String);
begin
  fNameSpecification := TStringEqualsIgnoreCase.Create(AName);
  fHasField := TRttiTypeHasField.Create(fNameSpecification);

  Assert.IsTrue(fHasField.IsSatisfiedBy(fInterfacedObjectRttiType));
end;

procedure TTestRttiType.TestHasMember(const AName: String);
begin
  fNameSpecification := TStringEqualsIgnoreCase.Create(AName);
  fHasMember := TRttiTypeHasMember.Create(fNameSpecification);

  Assert.IsTrue(fHasMember.IsSatisfiedBy(fInterfacedObjectRttiType));
end;

procedure TTestRttiType.TestHasMethod(const AName: String);
begin
  fNameSpecification := TStringEqualsIgnoreCase.Create(AName);
  fHasMethod := TRttiTypeHasMethod.Create(fNameSpecification);

  Assert.IsTrue(fHasMethod.IsSatisfiedBy(fInterfacedObjectRttiType));
end;

procedure TTestRttiType.TestHasProperty(const AName: String);
begin
  fNameSpecification := TStringEqualsIgnoreCase.Create(AName);
  fHasProperty := TRttiTypeHasProperty.Create(fNameSpecification);

  Assert.IsTrue(fHasProperty.IsSatisfiedBy(fInterfacedObjectRttiType));
end;

procedure TTestRttiType.TestNotHasField(const AName: String);
begin
  fNameSpecification := TStringEqualsIgnoreCase.Create(AName);
  fHasField := TRttiTypeHasField.Create(fNameSpecification);

  Assert.IsFalse(fHasField.IsSatisfiedBy(fInterfacedObjectRttiType));
end;

procedure TTestRttiType.TestNotHasMember(const AName: String);
begin
  fNameSpecification := TStringEqualsIgnoreCase.Create(AName);
  fHasMember := TRttiTypeHasMember.Create(fNameSpecification);

  Assert.IsFalse(fHasMember.IsSatisfiedBy(fInterfacedObjectRttiType));
end;

procedure TTestRttiType.TestNotHasMethod(const AName: String);
begin
  fNameSpecification := TStringEqualsIgnoreCase.Create(AName);
  fHasMethod := TRttiTypeHasMethod.Create(fNameSpecification);

  Assert.IsFalse(fHasMethod.IsSatisfiedBy(fInterfacedObjectRttiType));
end;

procedure TTestRttiType.TestNotHasProperty(const AName: String);
begin
  fNameSpecification := TStringEqualsIgnoreCase.Create(AName);
  fHasProperty := TRttiTypeHasProperty.Create(fNameSpecification);

  Assert.IsFalse(fHasProperty.IsSatisfiedBy(fInterfacedObjectRttiType));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestRttiType);
end.
