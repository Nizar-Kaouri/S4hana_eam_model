// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Damage analysis: number of notification items per object part and damage code, with notification header characteristics.
// Example: Damage-code Pareto per planning plant and notification type.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Notification Item (Damage) - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEAM_R_MaintNotifItem
  as select from ZEAM_I_MaintNotifItem
{
      @ObjectModel.foreignKey.association: '_MaintenanceNotification'
  key MaintenanceNotification,
  key MaintenanceNotificationItem,
      MaintNotifObjPrtCodeGroup,
      MaintNotifObjPrtCode,
      MaintNotifDamageCodeGroup,
      MaintNotificationDamageCode,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Items'
      cast( 1 as abap.int4 ) as NumberOfItems,

      /* Notification header characteristics */
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
      _MaintenanceNotification
}
