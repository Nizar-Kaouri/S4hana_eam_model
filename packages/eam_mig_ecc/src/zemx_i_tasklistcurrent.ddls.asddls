// ModuPorter EAM migration | Release 1.0.0
// Purpose: Current version of each maintenance task list header with the main work center as business key and the deletion flag.
// Example: Read the current task lists of plant 1000.
@AbapCatalog.sqlViewName: 'ZEMX_TLC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Current maintenance task list'
@ObjectModel.representativeKey: 'TaskListGroupCounter'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #COMPOSITE
define view ZEMX_I_TaskListCurrent
  as select from ZEMX_B_TaskListHeader as hdr
    inner join ZEMX_I_TaskListLatestVersion as latest on latest.TaskListType = hdr.TaskListType and latest.TaskListGroup = hdr.TaskListGroup and latest.TaskListGroupCounter = hdr.TaskListGroupCounter and latest.TaskListVersionCounter = hdr.TaskListVersionCounter
{
      @EndUserText.label: 'Task List Type'
  key hdr.TaskListType               as TaskListType,
      @EndUserText.label: 'Task List Group'
  key hdr.TaskListGroup              as TaskListGroup,
      @EndUserText.label: 'Task List Group Counter'
  key hdr.TaskListGroupCounter       as TaskListGroupCounter,
      @EndUserText.label: 'Task List Version Counter'
      hdr.TaskListVersionCounter     as TaskListVersionCounter,
      @EndUserText.label: 'Validity Start Date'
      hdr.ValidityStartDate          as ValidityStartDate,
      @EndUserText.label: 'Task List Desc'
      hdr.TaskListDesc               as TaskListDesc,
      @EndUserText.label: 'Plant'
      hdr.Plant                      as Plant,
      @EndUserText.label: 'Task List Usage'
      hdr.TaskListUsage              as TaskListUsage,
      @EndUserText.label: 'Task List Status'
      hdr.TaskListStatus             as TaskListStatus,
      @EndUserText.label: 'Maintenance Planner Group'
      hdr.MaintenancePlannerGroup    as MaintenancePlannerGroup,
      @EndUserText.label: 'Main Work Center'
      hdr._MainWorkCenter.WorkCenter as MainWorkCenter,
      @EndUserText.label: 'Main Work Center Plant'
      hdr._MainWorkCenter.Plant      as MainWorkCenterPlant,
      @EndUserText.label: 'Maintenance Strategy'
      hdr.MaintenanceStrategy        as MaintenanceStrategy,
      @EndUserText.label: 'Maint Object System Condition'
      hdr.MaintObjectSystemCondition as MaintObjectSystemCondition,
      @EndUserText.label: 'Main Work Center Internal ID'
      hdr.MainWorkCenterInternalID   as MainWorkCenterInternalID,
      @EndUserText.label: 'Is Marked For Deletion'
      hdr.IsMarkedForDeletion        as IsMarkedForDeletion,
      @EndUserText.label: 'Creation Date'
      hdr.CreationDate               as CreationDate,
      @EndUserText.label: 'Last Change Date'
      hdr.LastChangeDate             as LastChangeDate
}
