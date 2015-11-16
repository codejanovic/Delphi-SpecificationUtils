unit Delphi.SpecificationUtils.Reflection.Factory;

interface

uses
  Delphi.SpecificationUtils;

type
  TReflectionFactory = class(TInterfacedObject, 
                              IReflectionSpecifications,
                              IReflectionObjectSpecifications,
                              IReflectionRttiTypeSpecifications,
                              IReflectionRttiMemberSpecifications,
                              IReflectionRttiPropertySpecifications,
                              IReflectionRttiFieldSpecifications,
                              IReflectionRttiNamedObjectSpecifications,
                              IReflectionRttiValueSpecifications)
  protected
    fInstancesSpecifications: IReflectionObjectSpecifications;
    fRttiTypeSpecifications: IReflectionRttiTypeSpecifications;
    fRttiMemberSpecifications: IReflectionRttiMemberSpecifications;
    fRttiPropertySpecifications: IReflectionRttiPropertySpecifications;
    fRttiFieldSpecifications: IReflectionRttiFieldSpecifications;
    fRttiNamedObjectSpecifications: IReflectionRttiNamedObjectSpecifications;
    fRttiValueSpecifications: IReflectionRttiValueSpecifications;

    property InstancesDelegate: IReflectionObjectSpecifications read fInstancesSpecifications implements IReflectionObjectSpecifications;
    property RttiTypeDelegate: IReflectionRttiTypeSpecifications read fRttiTypeSpecifications implements IReflectionRttiTypeSpecifications;
    property RttiMemberDelegate: IReflectionRttiMemberSpecifications read fRttiMemberSpecifications implements IReflectionRttiMemberSpecifications;
    property RttiPropertyDelegate: IReflectionRttiPropertySpecifications read fRttiPropertySpecifications implements IReflectionRttiPropertySpecifications;
    property RttiFieldDelegate: IReflectionRttiFieldSpecifications read fRttiFieldSpecifications implements IReflectionRttiFieldSpecifications;
    property RttiNamedObjectDelegate: IReflectionRttiNamedObjectSpecifications read fRttiNamedObjectSpecifications implements IReflectionRttiNamedObjectSpecifications;
    property RttiValueDelegate: IReflectionRttiValueSpecifications read fRttiValueSpecifications implements IReflectionRttiValueSpecifications;
  public
    constructor Create;

    function Instances: IReflectionObjectSpecifications;
    function RttiType: IReflectionRttiTypeSpecifications;
    function RttiMember: IReflectionRttiMemberSpecifications;
    function RttiProperty: IReflectionRttiPropertySpecifications;
    function RttiField: IReflectionRttiFieldSpecifications;
    function RttiNamedObject: IReflectionRttiNamedObjectSpecifications;
    function RttiValue: IReflectionRttiValueSpecifications;
  end;

implementation

uses
  Delphi.SpecificationUtils.Reflection.Instance.Factory,
  Delphi.SpecificationUtils.Reflection.TRttiField.Factory,
  Delphi.SpecificationUtils.Reflection.TRttiMember.Factory,
  Delphi.SpecificationUtils.Reflection.TRttiNamedObject.Factory,
  Delphi.SpecificationUtils.Reflection.TRttiProperty.Factory,
  Delphi.SpecificationUtils.Reflection.TRttiType.Factory,
  Delphi.SpecificationUtils.Reflection.TValue.Factory;

{ TReflectionFactory }

constructor TReflectionFactory.Create;
begin
  fInstancesSpecifications := TReflectionInstanceFactory.Create;
  fRttiTypeSpecifications := TReflectionRttiTypeFactory.Create;
  fRttiMemberSpecifications := TReflectionRttiMemberFactory.Create;
  fRttiPropertySpecifications := TReflectionRttiPropertyFactory.Create;
  fRttiFieldSpecifications := TReflectionRttiFieldFactory.Create;
  fRttiNamedObjectSpecifications := TReflectionRttiNamedObjectFactory.Create;
  fRttiValueSpecifications := TReflectionRttiValueFactory.Create;
end;

function TReflectionFactory.Instances: IReflectionObjectSpecifications;
begin
  Result := InstancesDelegate;
end;

function TReflectionFactory.RttiField: IReflectionRttiFieldSpecifications;
begin
  Result := RttiFieldDelegate;
end;

function TReflectionFactory.RttiMember: IReflectionRttiMemberSpecifications;
begin
  Result := RttiMemberDelegate;
end;

function TReflectionFactory.RttiNamedObject: IReflectionRttiNamedObjectSpecifications;
begin
  Result := RttiNamedObjectDelegate;
end;

function TReflectionFactory.RttiProperty: IReflectionRttiPropertySpecifications;
begin
  Result := RttiPropertyDelegate;
end;

function TReflectionFactory.RttiType: IReflectionRttiTypeSpecifications;
begin
  Result := RttiTypeDelegate;
end;

function TReflectionFactory.RttiValue: IReflectionRttiValueSpecifications;
begin
  Result := RttiValueDelegate;
end;

end.
