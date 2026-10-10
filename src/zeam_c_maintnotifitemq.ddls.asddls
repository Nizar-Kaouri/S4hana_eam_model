// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZEAM_R_MaintNotifItem. Damage codes per planning plant (Pareto).
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZEAM_R_MaintNotifItem applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Damage Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZEAM_C_MaintNotifItemQ
  provider contract analytical_query
  as projection on ZEAM_R_MaintNotifItem
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  MaintenancePlanningPlant,
  @AnalyticsDetails.query.axis: #ROWS
  MaintNotificationDamageCode,
  @AnalyticsDetails.query.axis: #FREE
  MaintNotifDamageCodeGroup,
  @AnalyticsDetails.query.axis: #FREE
  MaintNotifObjPrtCodeGroup,
  @AnalyticsDetails.query.axis: #FREE
  MaintNotifObjPrtCode,
  @AnalyticsDetails.query.axis: #FREE
  NotificationType,
  @AnalyticsDetails.query.axis: #FREE
  MaintPriority,
  @AnalyticsDetails.query.axis: #FREE
  MaintenanceObjectIsDown,
  @AnalyticsDetails.query.axis: #FREE
  Equipment,
  @AnalyticsDetails.query.axis: #FREE
  FunctionalLocation,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlant,
  @AnalyticsDetails.query.axis: #FREE
  PlantSection,
  @AnalyticsDetails.query.axis: #FREE
  CreationDate,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfItems
}
