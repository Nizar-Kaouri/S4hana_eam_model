// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Cause analysis: number of causes per cause code, with item damage code and notification header characteristics.
// Example: Root-cause Pareto per planning plant; causes of breakdown notifications only.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Notification Cause - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEAM_R_MaintNotifCause
  as select from ZEAM_I_MaintNotifCause
{
      @ObjectModel.foreignKey.association: '_MaintenanceNotification'
  key MaintenanceNotification,
  key MaintenanceNotificationItem,
  key MaintenanceNotificationCause,
      MaintNotifCauseCodeGroup,
      MaintNotificationCauseCode,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Causes'
      cast( 1 as abap.int4 ) as NumberOfCauses,

      /* Notification header characteristics */
      _Item.MaintNotifObjPrtCode,
      _Item.MaintNotificationDamageCode,
      _MaintenanceNotification.NotificationType,
      _MaintenanceNotification.MaintPriority,
      _MaintenanceNotification.MaintenanceObjectIsDown,
      _MaintenanceNotification.CreationDate,
      _MaintenanceNotification.Equipment,
      _MaintenanceNotification.FunctionalLocation,
      _MaintenanceNotification.MaintenancePlanningPlant,
      _MaintenanceNotification.MaintenancePlannerGroup,
      _MaintenanceNotification.MaintenancePlant,
      _MaintenanceNotification.PlantSection,
      _MaintenanceNotification.MainWorkCenter,

      /* Associations */
      _MaintenanceNotification,
      _Item
}
