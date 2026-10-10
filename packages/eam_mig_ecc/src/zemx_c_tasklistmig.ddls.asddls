// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Current, not deleted maintenance task list headers.
// Example: The load program creates one task list per row.
@AbapCatalog.sqlViewName: 'ZEMX_CTL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Maintenance task list (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_TaskListMig
  as select from ZEMX_I_TaskListCurrent as src
{
  key src.TaskListType               as TaskListType,
  key src.TaskListGroup              as TaskListGroup,
  key src.TaskListGroupCounter       as TaskListGroupCounter,
      src.ValidityStartDate          as ValidityStartDate,
      src.TaskListDesc               as TaskListDesc,
      src.Plant                      as Plant,
      src.TaskListUsage              as TaskListUsage,
      src.TaskListStatus             as TaskListStatus,
      src.MaintenancePlannerGroup    as MaintenancePlannerGroup,
      src.MainWorkCenter             as MainWorkCenter,
      src.MainWorkCenterPlant        as MainWorkCenterPlant,
      src.MaintenanceStrategy        as MaintenanceStrategy,
      src.MaintObjectSystemCondition as MaintObjectSystemCondition,
      src.LastChangeDate             as LastChangeDate
}
where src.IsMarkedForDeletion = ''
