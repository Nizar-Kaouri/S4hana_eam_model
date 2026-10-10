// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Current, not deleted version of each maintenance task list header: the migration scope of the task list object.
// Example: Extract all rows of plant 1000: filter Plant = '1000'.
@AbapCatalog.sqlViewName: 'ZEMX_TLC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Current maintenance task list (migration scope)'
@ObjectModel.representativeKey: 'TaskListGroupCounter'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #COMPOSITE
define view ZEMX_R_TaskListCurrent
  as select from ZEMX_I_TaskList as tl
    inner join ZEMX_R_TaskListLatestVersion as latest on  latest.TaskListType           = tl.TaskListType
                                                       and latest.TaskListGroup          = tl.TaskListGroup
                                                       and latest.TaskListGroupCounter   = tl.TaskListGroupCounter
                                                       and latest.TaskListVersionCounter = tl.TaskListVersionCounter
{
  key tl.TaskListType               as TaskListType,
  key tl.TaskListGroup              as TaskListGroup,
  key tl.TaskListGroupCounter       as TaskListGroupCounter,
      tl.TaskListVersionCounter     as TaskListVersionCounter,
      tl.ValidityStartDate          as ValidityStartDate,
      tl.TaskListDesc               as TaskListDesc,
      tl.Plant                      as Plant,
      tl.TaskListUsage              as TaskListUsage,
      tl.TaskListStatus             as TaskListStatus,
      tl.MaintenancePlannerGroup    as MaintenancePlannerGroup,
      tl.MainWorkCenter             as MainWorkCenter,
      tl.MainWorkCenterPlant        as MainWorkCenterPlant,
      tl.MaintenanceStrategy        as MaintenanceStrategy,
      tl.MaintObjectSystemCondition as MaintObjectSystemCondition
}
where tl.IsMarkedForDeletion = ''
