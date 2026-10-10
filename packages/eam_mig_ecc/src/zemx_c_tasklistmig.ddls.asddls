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
      @EndUserText.label: 'Task List Type'
  key src.TaskListType               as TaskListType,
      @EndUserText.label: 'Task List Group'
  key src.TaskListGroup              as TaskListGroup,
      @EndUserText.label: 'Task List Group Counter'
  key src.TaskListGroupCounter       as TaskListGroupCounter,
      @EndUserText.label: 'Validity Start Date'
      src.ValidityStartDate          as ValidityStartDate,
      @EndUserText.label: 'Task List Desc'
      src.TaskListDesc               as TaskListDesc,
      @EndUserText.label: 'Plant'
      src.Plant                      as Plant,
      @EndUserText.label: 'Task List Usage'
      src.TaskListUsage              as TaskListUsage,
      @EndUserText.label: 'Task List Status'
      src.TaskListStatus             as TaskListStatus,
      @EndUserText.label: 'Maintenance Planner Group'
      src.MaintenancePlannerGroup    as MaintenancePlannerGroup,
      @EndUserText.label: 'Main Work Center'
      src.MainWorkCenter             as MainWorkCenter,
      @EndUserText.label: 'Main Work Center Plant'
      src.MainWorkCenterPlant        as MainWorkCenterPlant,
      @EndUserText.label: 'Maintenance Strategy'
      src.MaintenanceStrategy        as MaintenanceStrategy,
      @EndUserText.label: 'Maint Object System Condition'
      src.MaintObjectSystemCondition as MaintObjectSystemCondition,
      @EndUserText.label: 'Last Change Date'
      src.LastChangeDate             as LastChangeDate
}
where src.IsMarkedForDeletion = ''
