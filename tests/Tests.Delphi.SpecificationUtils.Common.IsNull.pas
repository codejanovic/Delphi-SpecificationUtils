unit Tests.Delphi.SpecificationUtils.Common.IsNull;

interface
uses
  DUnitX.TestFramework, Spring.DesignPatterns;

type

  [TestFixture]
  TTestCommonIsNull = class(TObject)
  protected
    fObjectIsNull: ISpecification<TObject>;
    fInterfacedObjectIsNull: ISpecification<IInterface>;
    
    fNullObject: TObject;
    fObject: TObject;
    fNullInterfacedObject: IInterface;
    fInterfacedObject: IInterface;
  public
    [Setup]
    procedure Setup;

    [Teardown]
    procedure Teardown;

    [Test]
    procedure TestObjectIsNull;
    [Test]
    procedure TestObjectIsNotNull;
    [Test]
    procedure TestInterfacedObjectIsNull;
    [Test]
    procedure TestInterfacedObjectIsNotNull;
  end;

implementation

uses
  Delphi.SpecificationUtils.Common;


{ TTestCommonIsNull }

procedure TTestCommonIsNull.Setup;
begin
  fNullObject := NIL;
  fObject := TObject.Create;
  fNullInterfacedObject := NIL;
  fInterfacedObject := TInterfacedObject.Create;
    
  fObjectIsNull := TObjectIsNull.Create;
  fInterfacedObjectIsNull := TInterfaceIsNull.Create;
end;

procedure TTestCommonIsNull.Teardown;
begin
  fObject.Free;
end;

procedure TTestCommonIsNull.TestInterfacedObjectIsNotNull;
begin
  Assert.IsFalse(fInterfacedObjectIsNull.IsSatisfiedBy(fInterfacedObject));
end;

procedure TTestCommonIsNull.TestInterfacedObjectIsNull;
begin
  Assert.IsTrue(fInterfacedObjectIsNull.IsSatisfiedBy(fNullInterfacedObject));
end;

procedure TTestCommonIsNull.TestObjectIsNotNull;
begin
  Assert.IsFalse(fObjectIsNull.IsSatisfiedBy(fObject));
end;

procedure TTestCommonIsNull.TestObjectIsNull;
begin
  Assert.IsTrue(fObjectIsNull.IsSatisfiedBy(fNullObject)); 
end;

initialization
  TDUnitX.RegisterTestFixture(TTestCommonIsNull);
end.
