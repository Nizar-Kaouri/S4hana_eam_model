// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on the equipment cube (rows plant x category, columns count and acquisition value).
// Example: Expose in a service definition, bind as OData V4 and open in an analytical list page or SAP Analytics Cloud.
// Analytical query on the Equipment cube.
// DESIGN NOTE: transient view entities are not SQL-readable; no DCL role is defined for
// this entity. Authorizations are enforced by the DCL of ZEAM_I_Equipment (the provider).
// TODO-VERIFY[H] GEN-Q01: @AccessControl.authorizationCheck: #NOT_ALLOWED is the correct value for a transient analytical query
// TODO-VERIFY[M] GEN-Q02: @VDM.viewType: #CONSUMPTION accepted on a transient view entity
// TODO-VERIFY[L] GEN-Q03: @AnalyticsDetails.query.axis and @Consumption.filter syntax in analytical_query projections
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Equipment Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZEAM_C_EquipmentQ
  provider contract analytical_query
  as projection on ZEAM_I_Equipment
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  MaintenancePlant,
  @AnalyticsDetails.query.axis: #ROWS
  EquipmentCategory,
  @AnalyticsDetails.query.axis: #FREE
  TechnicalObjectType,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlanningPlant,
  @AnalyticsDetails.query.axis: #FREE
  PlantSection,
  @AnalyticsDetails.query.axis: #FREE
  ABCIndicator,
  @AnalyticsDetails.query.axis: #FREE
  FunctionalLocation,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCode,
  @AnalyticsDetails.query.axis: #FREE
  CostCenter,
  @AnalyticsDetails.query.axis: #FREE
  AssetManufacturerName,
  @AnalyticsDetails.query.axis: #FREE
  ConstructionYear,
  @AnalyticsDetails.query.axis: #FREE
  Currency,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfEquipments,
  @AnalyticsDetails.query.axis: #COLUMNS
  AcquisitionValue
}
