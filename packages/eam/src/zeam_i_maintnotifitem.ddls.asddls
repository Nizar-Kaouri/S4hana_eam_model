// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per notification item with object part and damage codes (catalog code group + code) and item text.
// Example: Pareto of damage codes per equipment category (with the link cube) or per planning plant.
// Module notification_item has a hard dependency on maintenance_notification (association _MaintenanceNotification).
// TODO-VERIFY[H] NI-001: SAP released view for notification items is I_MaintenanceNotificationItem (name not confirmed)
// TODO-VERIFY[H] NI-002: elements MaintenanceNotificationItem, MaintNotifItemText, MaintNotifObjPrtCodeGroup, MaintNotifObjPrtCode, MaintNotifDamageCodeGroup, MaintNotificationDamageCode
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Maintenance Notification Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MaintenanceNotificationItem'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZEAM_I_MaintNotifItem
  as select from I_MaintenanceNotificationItem
  association [1..1] to ZEAM_I_MaintNotif as _MaintenanceNotification on $projection.MaintenanceNotification = _MaintenanceNotification.MaintenanceNotification
{
      @ObjectModel.foreignKey.association: '_MaintenanceNotification'
  key MaintenanceNotification,
  key MaintenanceNotificationItem,
      @Semantics.text: true
      MaintNotifItemText,
      MaintNotifObjPrtCodeGroup,
      MaintNotifObjPrtCode,
      MaintNotifDamageCodeGroup,
      MaintNotificationDamageCode,

      /* Associations */
      _MaintenanceNotification
}
