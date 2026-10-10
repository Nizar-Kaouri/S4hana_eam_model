// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on the notification cube (rows planning plant x notification type).
// Example: Notification backlog and breakdown share per plant in an analytical list page.
// DESIGN NOTE: no DCL (transient query); the DCL of ZEAM_R_MaintNotif applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Maintenance Notification Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZEAM_C_MaintNotifQ
  provider contract analytical_query
  as projection on ZEAM_R_MaintNotif
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  MaintenancePlanningPlant,
  @AnalyticsDetails.query.axis: #ROWS
  NotificationType,
  @AnalyticsDetails.query.axis: #FREE
  MaintPriority,
  @AnalyticsDetails.query.axis: #FREE
  NotifProcessingPhase,
  @AnalyticsDetails.query.axis: #FREE
  MaintNotifIsOpen,
  @AnalyticsDetails.query.axis: #FREE
  MaintenanceObjectIsDown,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlannerGroup,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlant,
  @AnalyticsDetails.query.axis: #FREE
  MainWorkCenter,
  @AnalyticsDetails.query.axis: #FREE
  Equipment,
  @AnalyticsDetails.query.axis: #FREE
  FunctionalLocation,
  @AnalyticsDetails.query.axis: #FREE
  CreationDate,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfNotifications,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOpenNotifications,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfBreakdownNotifs
}
