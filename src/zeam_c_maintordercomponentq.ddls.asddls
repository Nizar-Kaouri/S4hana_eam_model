// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZEAM_R_MaintOrderComponent. Spare-part demand and open quantities per plant and material.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZEAM_R_MaintOrderComponent applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Maintenance Order Component Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZEAM_C_MaintOrderComponentQ
  provider contract analytical_query
  as projection on ZEAM_R_MaintOrderComponent
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  Plant,
  @AnalyticsDetails.query.axis: #ROWS
  Material,
  @AnalyticsDetails.query.axis: #FREE
  MaintenanceOrderType,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlanningPlant,
  @AnalyticsDetails.query.axis: #FREE
  StorageLocation,
  @AnalyticsDetails.query.axis: #FREE
  MaintOrderIsOpen,
  @AnalyticsDetails.query.axis: #FREE
  MatlCompRequirementDate,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCode,
  @AnalyticsDetails.query.axis: #FREE
  CostCenter,
  @AnalyticsDetails.query.axis: #FREE
  BaseUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  RequirementQuantityInBaseUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  WithdrawnQuantity,
  @AnalyticsDetails.query.axis: #COLUMNS
  OpenQuantity,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfComponents
}
