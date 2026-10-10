// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Items of the open notifications with code groups and codes translated.
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
    inner join ZEMX_I_MaintNotification as obj on obj.MaintenanceNotification = src.MaintenanceNotification
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'MAINTENANCE_NOTIFICATION' and map01.SourceValue = src.MaintenanceNotification
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'CODE_GROUP' and map02.SourceValue = src.ObjectPartCodeGroup
    left outer join ZEMX_I_MigrationMap as map03 on map03.MapName = 'CODE' and map03.SourceValue = src.ObjectPartCode
    left outer join ZEMX_I_MigrationMap as map04 on map04.MapName = 'CODE_GROUP' and map04.SourceValue = src.DamageCodeGroup
    left outer join ZEMX_I_MigrationMap as map05 on map05.MapName = 'CODE' and map05.SourceValue = src.DamageCode
{
  key src.MaintenanceNotification    as LegacyMaintenanceNotification,
  key src.MaintNotificationItem      as MaintNotificationItem,
      coalesce( map01.TargetValue, src.MaintenanceNotification ) as MaintenanceNotification,
      coalesce( map02.TargetValue, src.ObjectPartCodeGroup ) as ObjectPartCodeGroup,
      coalesce( map03.TargetValue, src.ObjectPartCode ) as ObjectPartCode,
      coalesce( map04.TargetValue, src.DamageCodeGroup ) as DamageCodeGroup,
      coalesce( map05.TargetValue, src.DamageCode ) as DamageCode,
      src.MaintNotifItemText         as MaintNotifItemText
}
where src.IsMarkedForDeletion = '' and obj.IsCompleted = '' and obj.IsMarkedForDeletion = ''
