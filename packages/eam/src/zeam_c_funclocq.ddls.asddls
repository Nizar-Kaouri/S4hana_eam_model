// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on the functional location cube.
// Example: Structure overview per plant in an analytical list page.
// Analytical query on the Functional Location cube.
// DESIGN NOTE: transient view entities are not SQL-readable; no DCL role is defined for
// this entity. Authorizations are enforced by the DCL of ZEAM_R_FuncLoc (the provider).
// See GEN-Q01..GEN-Q03 in BATCH_REPORT.md (same open points as ZEAM_C_EquipmentQ).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Functional Location Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZEAM_C_FuncLocQ
  provider contract analytical_query
  as projection on ZEAM_R_FuncLoc
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  MaintenancePlant,
  @AnalyticsDetails.query.axis: #ROWS
  FunctionalLocationCategory,
  @AnalyticsDetails.query.axis: #FREE
  TechnicalObjectType,
  @AnalyticsDetails.query.axis: #FREE
  FuncLocationStructure,
  @AnalyticsDetails.query.axis: #FREE
  SuperiorFunctionalLocation,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlanningPlant,
  @AnalyticsDetails.query.axis: #FREE
  PlantSection,
  @AnalyticsDetails.query.axis: #FREE
  ABCIndicator,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCode,
  @AnalyticsDetails.query.axis: #FREE
  CostCenter,
  @AnalyticsDetails.query.axis: #FREE
  ConstructionYear,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfFunctionalLocations
}
