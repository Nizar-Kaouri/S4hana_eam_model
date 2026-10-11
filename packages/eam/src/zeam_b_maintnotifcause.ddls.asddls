// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per cause of a notification item with cause code group, cause code and text.
// Example: Root-cause Pareto (cause codes) per planning plant and notification type.
// TODO-VERIFY[H] NI-010: SAP released view for notification causes is I_MaintenanceNotificationCause (name not confirmed)
// TODO-VERIFY[H] NI-011: elements MaintenanceNotificationCause, MaintNotifCauseText, MaintNotifCauseCodeGroup, MaintNotificationCauseCode
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Maintenance Notification Cause'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MaintenanceNotificationCause'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZEAM_B_MaintNotifCause
  as select from I_MaintenanceNotificationCause
  association [1..1] to ZEAM_B_MaintNotif     as _MaintenanceNotification on  $projection.MaintenanceNotification = _MaintenanceNotification.MaintenanceNotification
  association [1..1] to ZEAM_B_MaintNotifItem as _Item                    on  $projection.MaintenanceNotification     = _Item.MaintenanceNotification
                                                                          and $projection.MaintenanceNotificationItem = _Item.MaintenanceNotificationItem
{
      @ObjectModel.foreignKey.association: '_MaintenanceNotification'
  key MaintenanceNotification,
  key MaintenanceNotificationItem,
  key MaintenanceNotificationCause,
      @Semantics.text: true
      MaintNotifCauseText,
      MaintNotifCauseCodeGroup,
      MaintNotificationCauseCode,

      /* Associations */
      _MaintenanceNotification,
      _Item
}
