// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Work centers to migrate (not flagged for deletion) with plant, category and responsible person translated through the migration map.
// Example: The load program reads all rows and creates one work center per row; LegacyWorkCenter / LegacyPlant identify the source record.
@AbapCatalog.sqlViewName: 'ZEMX_CWC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Work center (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_WorkCenterMig
  as select from ZEMX_I_WorkCenterHeader as src
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'WORK_CENTER' and map01.SourceValue = src.WorkCenter
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'PLANT' and map02.SourceValue = src.Plant
    left outer join ZEMX_I_MigrationMap as map03 on map03.MapName = 'WORK_CENTER_CATEGORY' and map03.SourceValue = src.WorkCenterCategoryCode
    left outer join ZEMX_I_MigrationMap as map04 on map04.MapName = 'WORK_CENTER_RESPONSIBLE' and map04.SourceValue = src.WorkCenterResponsible
    left outer join ZEMX_I_MigrationMap as map05 on map05.MapName = 'TASK_LIST_USAGE' and map05.SourceValue = src.TaskListUsage
{
  key src.WorkCenter                 as LegacyWorkCenter,
  key src.Plant                      as LegacyPlant,
      coalesce( map01.TargetValue, src.WorkCenter ) as WorkCenter,
      coalesce( map02.TargetValue, src.Plant ) as Plant,
      coalesce( map03.TargetValue, src.WorkCenterCategoryCode ) as WorkCenterCategoryCode,
      coalesce( map04.TargetValue, src.WorkCenterResponsible ) as WorkCenterResponsible,
      coalesce( map05.TargetValue, src.TaskListUsage ) as TaskListUsage,
      src.ValidityStartDate          as ValidityStartDate,
      src.ValidityEndDate            as ValidityEndDate
}
where src.IsMarkedForDeletion = ''
