// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Composite view / analytical cube for Functional Location (one row per functional location).
// TODO-VERIFY[L] FL-R01: literal measure cast( 1 as abap.int4 ) with @Aggregation.default: #SUM in a #CUBE view entity
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Functional Location - Cube'
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
define view entity ZEAM_R_FuncLoc
  as select from ZEAM_I_FuncLoc
  association [1..1] to ZEAM_I_FuncLoc as _FunctionalLocation on $projection.FunctionalLocation = _FunctionalLocation.FunctionalLocation
{
      @ObjectModel.foreignKey.association: '_FunctionalLocation'
  key FunctionalLocation,
      FunctionalLocationLabelName,
      @ObjectModel.foreignKey.association: '_FunctionalLocationCategory'
      FunctionalLocationCategory,
      FuncLocationStructure,
      @ObjectModel.foreignKey.association: '_SuperiorFunctionalLocation'
      SuperiorFunctionalLocation,
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
      @ObjectModel.foreignKey.association: '_CompanyCode'
      CompanyCode,
      BusinessArea,
      ControllingArea,
      CostCenter,
      AssetManufacturerName,
      ConstructionYear,
      OperationStartDate,
      CreationDate,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Functional Locations'
      cast( 1 as abap.int4 ) as NumberOfFunctionalLocations,

      /* Associations */
      _SuperiorFunctionalLocation,
      _MaintenancePlant,
      _MaintenancePlanningPlant,
      _CompanyCode,
      _FunctionalLocationCategory,
      _TechnicalObjectType,
      _FunctionalLocation
}
