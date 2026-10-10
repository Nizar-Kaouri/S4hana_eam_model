// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per equipment (current time segment) with installation location, organizational assignment, manufacturer data and acquisition value; dimension for every cube that references an equipment.
// Example: Read equipment attributes such as plant section or ABC indicator without touching SAP tables.
// Basic interface view / analytical dimension for Equipment (current time segment only).
// Cross-module associations (e.g. to Functional Location) are NOT allowed here;
// they live in link views (see ZEAM_I_EquipmentWithFuncLoc).
// TODO-VERIFY[H] EQ-001: I_Equipment key is (Equipment, ValidityEndDate); current segment has ValidityEndDate = 99991231
// TODO-VERIFY[M] EQ-002: I_EquipmentCategory exists (key EquipmentCategory) and is released
// TODO-VERIFY[M] EQ-003: I_TechnicalObjectType exists (key TechnicalObjectType) and is released
// TODO-VERIFY[H] EQ-019: location/account-assignment data (ILOA: MaintenancePlant, PlantSection, CompanyCode, BusinessArea, CostCenter...) are direct elements of I_Equipment and not only reachable via an association
// TODO-VERIFY[L] EQ-004: @Analytics.internalName: #LOCAL accepted on a #DIMENSION view entity
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Equipment'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Equipment'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEAM_I_Equipment
  as select from I_Equipment
  association [0..*] to ZEAM_I_EquipmentText as _Text                   on $projection.Equipment = _Text.Equipment
  association [0..1] to ZEAM_I_Equipment     as _SuperordinateEquipment on $projection.SuperordinateEquipment = _SuperordinateEquipment.Equipment
  association [0..1] to I_Plant              as _MaintenancePlant       on $projection.MaintenancePlant = _MaintenancePlant.Plant
  association [0..1] to I_Plant              as _MaintenancePlanningPlant on $projection.MaintenancePlanningPlant = _MaintenancePlanningPlant.Plant
  association [0..1] to I_CompanyCode        as _CompanyCode            on $projection.CompanyCode = _CompanyCode.CompanyCode
  association [0..1] to I_EquipmentCategory  as _EquipmentCategory      on $projection.EquipmentCategory = _EquipmentCategory.EquipmentCategory
  association [0..1] to I_TechnicalObjectType as _TechnicalObjectType   on $projection.TechnicalObjectType = _TechnicalObjectType.TechnicalObjectType
{
      @ObjectModel.text.association: '_Text'
  key Equipment,
      // TODO-VERIFY[M] EQ-010: ValidityStartDate / ValidityEndDate element names in I_Equipment
      ValidityStartDate,
      ValidityEndDate,
      @ObjectModel.foreignKey.association: '_EquipmentCategory'
      EquipmentCategory,
      @ObjectModel.foreignKey.association: '_TechnicalObjectType'
      TechnicalObjectType,
      // TODO-VERIFY[M] EQ-011: AuthorizationGroup element name in I_Equipment (EQUI-BEGRU)
      AuthorizationGroup,
      @ObjectModel.foreignKey.association: '_MaintenancePlant'
      MaintenancePlant,
      @ObjectModel.foreignKey.association: '_MaintenancePlanningPlant'
      MaintenancePlanningPlant,
      // TODO-VERIFY[M] EQ-012: MaintenancePlannerGroup, PlantSection, AssetLocation, AssetRoom, ABCIndicator in I_Equipment
      MaintenancePlannerGroup,
      PlantSection,
      AssetLocation,
      AssetRoom,
      ABCIndicator,
      FunctionalLocation,
      @ObjectModel.foreignKey.association: '_SuperordinateEquipment'
      SuperordinateEquipment,
      // TODO-VERIFY[M] EQ-013: EquipInstallationPositionNmbr element name (EQUZ-HEQNR)
      EquipInstallationPositionNmbr,
      @ObjectModel.foreignKey.association: '_CompanyCode'
      CompanyCode,
      BusinessArea,
      ControllingArea,
      CostCenter,
      // TODO-VERIFY[M] EQ-014: MasterFixedAsset / FixedAsset element names in I_Equipment
      MasterFixedAsset,
      FixedAsset,
      Material,
      SerialNumber,
      // TODO-VERIFY[M] EQ-015: manufacturer element names (AssetManufacturerName, ManufacturerPartNmbr, ManufacturerSerialNumber, ConstructionYear)
      AssetManufacturerName,
      ManufacturerPartNmbr,
      ManufacturerSerialNumber,
      ConstructionYear,
      // TODO-VERIFY[M] EQ-016: InventoryNumber / OperationStartDate element names in I_Equipment
      InventoryNumber,
      OperationStartDate,
      // TODO-VERIFY[H] EQ-017: AcquisitionValue + Currency element names and amount/currency semantics in I_Equipment
      @Semantics.amount.currencyCode: 'Currency'
      AcquisitionValue,
      Currency,
      // TODO-VERIFY[M] EQ-018: CreationDate / CreatedByUser element names in I_Equipment
      CreationDate,
      CreatedByUser,

      /* Associations */
      _Text,
      _SuperordinateEquipment,
      _MaintenancePlant,
      _MaintenancePlanningPlant,
      _CompanyCode,
      _EquipmentCategory,
      _TechnicalObjectType
}
where
  ValidityEndDate = '99991231'
