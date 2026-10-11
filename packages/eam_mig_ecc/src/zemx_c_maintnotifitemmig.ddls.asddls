// ModuPorter EAM migration | Release 1.0.0
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
      @EndUserText.label: 'Maintenance Notification'
  key src.MaintenanceNotification as MaintenanceNotification,
      @EndUserText.label: 'Maint Notification Item'
  key src.MaintNotificationItem   as MaintNotificationItem,
      @EndUserText.label: 'Object Part Code Group'
      src.ObjectPartCodeGroup     as ObjectPartCodeGroup,
      @EndUserText.label: 'Object Part Code'
      src.ObjectPartCode          as ObjectPartCode,
      @EndUserText.label: 'Damage Code Group'
      src.DamageCodeGroup         as DamageCodeGroup,
      @EndUserText.label: 'Damage Code'
      src.DamageCode              as DamageCode,
      @EndUserText.label: 'Maint Notif Item Text'
      src.MaintNotifItemText      as MaintNotifItemText
}
where src.IsMarkedForDeletion = '' and _MaintNotification.IsCompleted = '' and _MaintNotification.IsMarkedForDeletion = ''
