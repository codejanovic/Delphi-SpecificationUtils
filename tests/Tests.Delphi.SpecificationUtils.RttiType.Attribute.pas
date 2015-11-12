unit Tests.Delphi.SpecificationUtils.RttiType.Attribute;

interface

uses
  DUnitX.TestFramework,
  Spring.DesignPatterns,
  System.Rtti, DSharp.Core.Reflection;

type
  MyNewCustomAttributeAttribute = class(TCustomAttribute)
  end;

  [MyNewCustomAttribute]
  TTestObject = class
  end;

  [TestFixture]
  TTestRttiTypeAttributes = class(TObject)
  protected
    fNameSpecification: ISpecification<String>;
    fHasAttribute: ISpecification<TRttiType>;
    fHasAttributeType: ISpecification<TRttiType>;
    fObject: TTestObject;
    fObjectRttiType: TRttiType;
  public
    [Setup]
    procedure Setup;
    [Teardown]
    procedure Teardown;

    [TestCase('1','MyNewCustomAttribute')]
    procedure TestHasAttribute(const AAttributeName: String);

    [TestCase('1','NonExisting')]
    procedure TestHasNotAttribute(const AAttributeName: String);

    [Test]
    procedure TestHasMyCustomAttribute;
  end;

implementation

uses
  Delphi.SpecificationUtils.Strings.IgnoreCase,
  Delphi.SpecificationUtils.TRttiType;


{ TTestRttiTypeAttributes }

procedure TTestRttiTypeAttributes.Setup;
begin
  fObject := TTestObject.Create;
  fObjectRttiType := fObject.GetType
end;

procedure TTestRttiTypeAttributes.Teardown;
begin
  fObject.Free;
end;

procedure TTestRttiTypeAttributes.TestHasAttribute(const AAttributeName: String);
begin
  fNameSpecification := TStringEqualsIgnoreCase.Create(AAttributeName);
  fHasAttribute := TRttiTypeHasAttribute.Create(fNameSpecification);

  Assert.IsTrue(fHasAttribute.IsSatisfiedBy(fObjectRttiType));
end;

procedure TTestRttiTypeAttributes.TestHasMyCustomAttribute;
begin
  fHasAttributeType := TRttiTypeHasAttributeType<MyNewCustomAttributeAttribute>.Create;
  Assert.IsTrue(fHasAttributeType.IsSatisfiedBy(fObjectRttiType));
end;

procedure TTestRttiTypeAttributes.TestHasNotAttribute(const AAttributeName: String);
begin
  fNameSpecification := TStringEqualsIgnoreCase.Create(AAttributeName);
  fHasAttribute := TRttiTypeHasAttribute.Create(fNameSpecification);

  Assert.IsFalse(fHasAttribute.IsSatisfiedBy(fObjectRttiType));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestRttiTypeAttributes);
end.
