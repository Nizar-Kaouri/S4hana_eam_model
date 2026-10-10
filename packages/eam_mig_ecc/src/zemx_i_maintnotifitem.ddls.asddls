// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
  key itm.MaintenanceNotification as MaintenanceNotification,
  key itm.MaintNotificationItem   as MaintNotificationItem,
      itm.ObjectPartCodeGroup     as ObjectPartCodeGroup,
      itm.ObjectPartCode          as ObjectPartCode,
      itm.DamageCodeGroup         as DamageCodeGroup,
      itm.DamageCode              as DamageCode,
      itm.MaintNotifItemText      as MaintNotifItemText,
      itm.IsMarkedForDeletion     as IsMarkedForDeletion
}
