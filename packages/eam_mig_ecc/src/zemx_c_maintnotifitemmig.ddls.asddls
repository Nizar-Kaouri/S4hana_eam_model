// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Items of the open notifications with code groups and codes.
// Example: The load program adds the items to the notification created from ZEMX_C_MaintNotificationMig.
@AbapCatalog.sqlViewName: 'ZEMX_CNOI'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Notification item (migration)'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MaintNotifItemMig
  as select from ZEMX_I_MaintNotifItem as src
  association [0..1] to ZEMX_I_MaintNotification as _MaintNotification on _MaintNotification.MaintenanceNotification = $projection.MaintenanceNotification
{
  key src.MaintenanceNotification as MaintenanceNotification,
  key src.MaintNotificationItem   as MaintNotificationItem,
      src.ObjectPartCodeGroup     as ObjectPartCodeGroup,
      src.ObjectPartCode          as ObjectPartCode,
      src.DamageCodeGroup         as DamageCodeGroup,
      src.DamageCode              as DamageCode,
      src.MaintNotifItemText      as MaintNotifItemText
}
where src.IsMarkedForDeletion = '' and _MaintNotification.IsCompleted = '' and _MaintNotification.IsMarkedForDeletion = ''
