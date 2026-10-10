// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Highest version counter per task list group and group counter (helper for the current task list).
// Example: Read the current version of task list group 4711 / counter 01.
@AbapCatalog.sqlViewName: 'ZEMX_TLV'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Task list latest version'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #COMPOSITE
define view ZEMX_I_TaskListLatestVersion
  as select from ZEMX_I_TaskListHeader as hdr
{
      @EndUserText.label: 'Task List Type'
  key hdr.TaskListType               as TaskListType,
      @EndUserText.label: 'Task List Group'
  key hdr.TaskListGroup              as TaskListGroup,
      @EndUserText.label: 'Task List Group Counter'
  key hdr.TaskListGroupCounter       as TaskListGroupCounter,
      @EndUserText.label: 'Task List Version Counter'
      max( hdr.TaskListVersionCounter ) as TaskListVersionCounter
}
group by hdr.TaskListType, hdr.TaskListGroup, hdr.TaskListGroupCounter
