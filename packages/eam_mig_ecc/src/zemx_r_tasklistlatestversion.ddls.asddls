// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Highest version counter per task list group and group counter (helper for the current task list).
// Example: Read the current version of task list group 4711 / counter 1.
@AbapCatalog.sqlViewName: 'ZEMX_TLV'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Task list latest version (helper)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #COMPOSITE
define view ZEMX_R_TaskListLatestVersion
  as select from ZEMX_I_TaskList
{
  key TaskListType                  as TaskListType,
  key TaskListGroup                 as TaskListGroup,
  key TaskListGroupCounter          as TaskListGroupCounter,
      max( TaskListVersionCounter ) as TaskListVersionCounter
}
group by TaskListType, TaskListGroup, TaskListGroupCounter
