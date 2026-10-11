// ModuPorter EAM migration | Release 1.0.0
// Purpose: Items of PM notifications (restricted to notifications with maintenance data).
// Example: Read the items of notification 10000001.
@AbapCatalog.sqlViewName: 'ZEMX_NOI'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Maintenance notification item'
@ObjectModel.representativeKey: 'MaintNotificationItem'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_MaintNotifItem
  as select from ZEMX_I_NotificationItemData as itm
    inner join ZEMX_I_NotificationMaintData as pm on pm.MaintenanceNotification = itm.MaintenanceNotification
{
      @EndUserText.label: 'Maintenance Notification'
  key itm.MaintenanceNotification as MaintenanceNotification,
      @EndUserText.label: 'Maint Notification Item'
  key itm.MaintNotificationItem   as MaintNotificationItem,
      @EndUserText.label: 'Object Part Code Group'
      itm.ObjectPartCodeGroup     as ObjectPartCodeGroup,
      @EndUserText.label: 'Object Part Code'
      itm.ObjectPartCode          as ObjectPartCode,
      @EndUserText.label: 'Damage Code Group'
      itm.DamageCodeGroup         as DamageCodeGroup,
      @EndUserText.label: 'Damage Code'
      itm.DamageCode              as DamageCode,
      @EndUserText.label: 'Maint Notif Item Text'
      itm.MaintNotifItemText      as MaintNotifItemText,
      @EndUserText.label: 'Is Marked For Deletion'
      itm.IsMarkedForDeletion     as IsMarkedForDeletion
}
