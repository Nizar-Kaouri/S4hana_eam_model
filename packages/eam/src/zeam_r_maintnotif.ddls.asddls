// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Notification cube with counters for all, open and breakdown notifications.
// Example: Open breakdown notifications per planning plant and priority; notification intake per month.
// TODO-VERIFY[L] NT-R01: counter measures built with case expressions and @Aggregation.default: #SUM
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Maintenance Notification - Cube'
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
define view entity ZEAM_R_MaintNotif
  as select from ZEAM_I_MaintNotif
  association [1..1] to ZEAM_I_MaintNotif as _MaintenanceNotification on $projection.MaintenanceNotification = _MaintenanceNotification.MaintenanceNotification
{
      @ObjectModel.foreignKey.association: '_MaintenanceNotification'
  key MaintenanceNotification,
      NotificationType,
      MaintPriority,
      NotifProcessingPhase,
      MaintNotifIsOpen,
      MaintenanceObjectIsDown,
      CreationDate,
      MalfunctionStartDate,
      Equipment,
      FunctionalLocation,
      MaintenanceOrder,
      @ObjectModel.foreignKey.association: '_MaintenancePlanningPlant'
      MaintenancePlanningPlant,
      MaintenancePlannerGroup,
      @ObjectModel.foreignKey.association: '_MaintenancePlant'
      MaintenancePlant,
      PlantSection,
      MainWorkCenter,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Notifications'
      cast( 1 as abap.int4 ) as NumberOfNotifications,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Open Notifications'
      cast( case when MaintNotifIsOpen = 'X' then 1 else 0 end as abap.int4 ) as NumberOfOpenNotifications,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Breakdown Notifications'
      cast( case when MaintenanceObjectIsDown = 'X' then 1 else 0 end as abap.int4 ) as NumberOfBreakdownNotifs,

      /* Associations */
      _MaintenancePlant,
      _MaintenancePlanningPlant,
      _MaintenanceNotification
}
