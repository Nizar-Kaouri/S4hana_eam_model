// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Cube over the equipment population with measures NumberOfEquipments and AcquisitionValue (per currency).
// Example: Installed base per plant and equipment category; acquisition value by manufacturer.
// Composite view / analytical cube for Equipment (one row per current equipment).
// TODO-VERIFY[L] EQ-R01: literal measure cast( 1 as abap.int4 ) with @Aggregation.default: #SUM in a #CUBE view entity
// TODO-VERIFY[M] EQ-R02: amount measure AcquisitionValue aggregates per Currency (depends on EQ-017)
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Equipment - Cube'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEAM_I_Equipment
  as select from ZEAM_B_Equipment
  association [1..1] to ZEAM_B_Equipment as _Equipment on $projection.Equipment = _Equipment.Equipment
{
      @ObjectModel.foreignKey.association: '_Equipment'
  key Equipment,
      @ObjectModel.foreignKey.association: '_EquipmentCategory'
      EquipmentCategory,
      @ObjectModel.foreignKey.association: '_TechnicalObjectType'
      TechnicalObjectType,
      AuthorizationGroup,
      @ObjectModel.foreignKey.association: '_MaintenancePlant'
      MaintenancePlant,
      @ObjectModel.foreignKey.association: '_MaintenancePlanningPlant'
      MaintenancePlanningPlant,
      MaintenancePlannerGroup,
      PlantSection,
      AssetLocation,
      ABCIndicator,
      FunctionalLocation,
      @ObjectModel.foreignKey.association: '_SuperordinateEquipment'
      SuperordinateEquipment,
      @ObjectModel.foreignKey.association: '_CompanyCode'
      CompanyCode,
      BusinessArea,
      ControllingArea,
      CostCenter,
      AssetManufacturerName,
      ConstructionYear,
      OperationStartDate,
      CreationDate,
      Currency,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Equipment'
      cast( 1 as abap.int4 ) as NumberOfEquipments,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'Currency'
      AcquisitionValue,

      /* Associations */
      _SuperordinateEquipment,
      _MaintenancePlant,
      _MaintenancePlanningPlant,
      _CompanyCode,
      _EquipmentCategory,
      _TechnicalObjectType,
      _Equipment
}
