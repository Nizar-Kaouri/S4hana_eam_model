// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Open notifications (not completed, not deleted) with codes and keys translated.
// Example: The load program creates one notification per row and writes old -> new numbers into the key map 'MAINTENANCE_NOTIFICATION'.
@AbapCatalog.sqlViewName: 'ZEMX_CNO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Maintenance notification (migration)'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MaintNotificationMig
  as select from ZEMX_I_MaintNotification as src
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'MAINTENANCE_NOTIFICATION' and map01.SourceValue = src.MaintenanceNotification
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'NOTIFICATION_TYPE' and map02.SourceValue = src.NotificationType
    left outer join ZEMX_I_MigrationMap as map03 on map03.MapName = 'PRIORITY' and map03.SourceValue = src.MaintPriority
    left outer join ZEMX_I_MigrationMap as map04 on map04.MapName = 'PRIORITY_TYPE' and map04.SourceValue = src.MaintPriorityType
    left outer join ZEMX_I_MigrationMap as map05 on map05.MapName = 'CODE_GROUP' and map05.SourceValue = src.NotificationCodeGroup
    left outer join ZEMX_I_MigrationMap as map06 on map06.MapName = 'CODE' and map06.SourceValue = src.NotificationCode
    left outer join ZEMX_I_MigrationMap as map07 on map07.MapName = 'EQUIPMENT' and map07.SourceValue = src.Equipment
    left outer join ZEMX_I_MigrationMap as map08 on map08.MapName = 'FUNCTIONAL_LOCATION' and map08.SourceValue = src.FunctionalLocation
    left outer join ZEMX_I_MigrationMap as map09 on map09.MapName = 'PLANT' and map09.SourceValue = src.MaintenancePlanningPlant
    left outer join ZEMX_I_MigrationMap as map10 on map10.MapName = 'PLANNER_GROUP' and map10.SourceValue = src.MaintenancePlannerGroup
    left outer join ZEMX_I_MigrationMap as map11 on map11.MapName = 'WORK_CENTER' and map11.SourceValue = src.MainWorkCenter
    left outer join ZEMX_I_MigrationMap as map12 on map12.MapName = 'PLANT' and map12.SourceValue = src.MainWorkCenterPlant
    left outer join ZEMX_I_MigrationMap as map13 on map13.MapName = 'PLANT' and map13.SourceValue = src.MaintenancePlant
    left outer join ZEMX_I_MigrationMap as map14 on map14.MapName = 'PLANT_SECTION' and map14.SourceValue = src.PlantSection
{
  key src.MaintenanceNotification    as LegacyMaintenanceNotification,
      coalesce( map01.TargetValue, src.MaintenanceNotification ) as MaintenanceNotification,
      coalesce( map02.TargetValue, src.NotificationType ) as NotificationType,
      src.NotificationText           as NotificationText,
      coalesce( map03.TargetValue, src.MaintPriority ) as MaintPriority,
      coalesce( map04.TargetValue, src.MaintPriorityType ) as MaintPriorityType,
      src.NotificationDate           as NotificationDate,
      src.NotificationTime           as NotificationTime,
      src.ReportedByUser             as ReportedByUser,
      src.RequiredStartDate          as RequiredStartDate,
      src.RequiredEndDate            as RequiredEndDate,
      src.NotificationCatalog        as NotificationCatalog,
      coalesce( map05.TargetValue, src.NotificationCodeGroup ) as NotificationCodeGroup,
      coalesce( map06.TargetValue, src.NotificationCode ) as NotificationCode,
      coalesce( map07.TargetValue, src.Equipment ) as Equipment,
      coalesce( map08.TargetValue, src.FunctionalLocation ) as FunctionalLocation,
      coalesce( map09.TargetValue, src.MaintenancePlanningPlant ) as MaintenancePlanningPlant,
      coalesce( map10.TargetValue, src.MaintenancePlannerGroup ) as MaintenancePlannerGroup,
      coalesce( map11.TargetValue, src.MainWorkCenter ) as MainWorkCenter,
      coalesce( map12.TargetValue, src.MainWorkCenterPlant ) as MainWorkCenterPlant,
      coalesce( map13.TargetValue, src.MaintenancePlant ) as MaintenancePlant,
      coalesce( map14.TargetValue, src.PlantSection ) as PlantSection,
      src.MaintenanceObjectIsDown    as MaintenanceObjectIsDown,
      src.MalfunctionStartDate       as MalfunctionStartDate,
      src.MalfunctionStartTime       as MalfunctionStartTime,
      src.MalfunctionEndDate         as MalfunctionEndDate,
      src.MalfunctionEndTime         as MalfunctionEndTime,
      src.LastChangeDate             as LastChangeDate
}
where src.IsCompleted = '' and src.IsMarkedForDeletion = ''
