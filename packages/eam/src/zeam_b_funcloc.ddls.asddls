// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per functional location with external label, category, structure indicator, superior location and organizational assignment; dimension for cubes referencing a functional location.
// Example: Navigate up the structure via _SuperiorFunctionalLocation; report on locations per plant section.
// Basic interface view / analytical dimension for Functional Location.
// Cross-module associations (e.g. to Equipment) are NOT allowed here;
// they live in link views (see ZEAM_B_FuncLocWithEquipment).
// TODO-VERIFY[H] FL-001: I_FunctionalLocation key element is FunctionalLocation (internal TPLNR) and is not time-dependent
// TODO-VERIFY[H] FL-002: FunctionalLocationLabelName is the element for the external label (IFLOT-STRNO equivalent)
// TODO-VERIFY[H] FL-010: location/account-assignment data (ILOA) are direct elements of I_FunctionalLocation and not only reachable via an association
// TODO-VERIFY[M] FL-003: I_FunctionalLocationCategory exists (key FunctionalLocationCategory) and is released
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Functional Location'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'FunctionalLocation'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEAM_B_FuncLoc
  as select from I_FunctionalLocation
  association [0..*] to ZEAM_B_FuncLocText           as _Text                       on $projection.FunctionalLocation = _Text.FunctionalLocation
  association [0..1] to ZEAM_B_FuncLoc               as _SuperiorFunctionalLocation on $projection.SuperiorFunctionalLocation = _SuperiorFunctionalLocation.FunctionalLocation
  association [0..1] to I_Plant                      as _MaintenancePlant           on $projection.MaintenancePlant = _MaintenancePlant.Plant
  association [0..1] to I_Plant                      as _MaintenancePlanningPlant   on $projection.MaintenancePlanningPlant = _MaintenancePlanningPlant.Plant
  association [0..1] to I_CompanyCode                as _CompanyCode                on $projection.CompanyCode = _CompanyCode.CompanyCode
  association [0..1] to I_FunctionalLocationCategory as _FunctionalLocationCategory on $projection.FunctionalLocationCategory = _FunctionalLocationCategory.FunctionalLocationCategory
  association [0..1] to I_TechnicalObjectType        as _TechnicalObjectType        on $projection.TechnicalObjectType = _TechnicalObjectType.TechnicalObjectType
{
      @ObjectModel.text.association: '_Text'
  key FunctionalLocation,
      FunctionalLocationLabelName,
      @ObjectModel.foreignKey.association: '_FunctionalLocationCategory'
      FunctionalLocationCategory,
      // TODO-VERIFY[H] FL-004: element name for the structure indicator (IFLOT-TPLKZ); assumed FuncLocationStructure
      FuncLocationStructure,
      @ObjectModel.foreignKey.association: '_SuperiorFunctionalLocation'
      // TODO-VERIFY[M] FL-005: SuperiorFunctionalLocation element name (IFLOT-TPLMA)
      SuperiorFunctionalLocation,
      @ObjectModel.foreignKey.association: '_TechnicalObjectType'
      TechnicalObjectType,
      // TODO-VERIFY[M] FL-006: AuthorizationGroup element name in I_FunctionalLocation (IFLOT-BEGRU)
      AuthorizationGroup,
      @ObjectModel.foreignKey.association: '_MaintenancePlant'
      MaintenancePlant,
      @ObjectModel.foreignKey.association: '_MaintenancePlanningPlant'
      MaintenancePlanningPlant,
      // TODO-VERIFY[M] FL-007: MaintenancePlannerGroup, PlantSection, AssetLocation, AssetRoom, ABCIndicator in I_FunctionalLocation
      MaintenancePlannerGroup,
      PlantSection,
      AssetLocation,
      AssetRoom,
      ABCIndicator,
      @ObjectModel.foreignKey.association: '_CompanyCode'
      CompanyCode,
      BusinessArea,
      ControllingArea,
      CostCenter,
      // TODO-VERIFY[M] FL-008: manufacturer / construction / inventory element names in I_FunctionalLocation
      AssetManufacturerName,
      ConstructionYear,
      InventoryNumber,
      OperationStartDate,
      // TODO-VERIFY[M] FL-009: CreationDate / CreatedByUser element names in I_FunctionalLocation
      CreationDate,
      CreatedByUser,

      /* Associations */
      _Text,
      _SuperiorFunctionalLocation,
      _MaintenancePlant,
      _MaintenancePlanningPlant,
      _CompanyCode,
      _FunctionalLocationCategory,
      _TechnicalObjectType
}
