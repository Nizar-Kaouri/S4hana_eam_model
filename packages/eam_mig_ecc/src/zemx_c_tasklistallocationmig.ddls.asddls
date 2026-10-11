// ModuPorter EAM migration | Release 1.0.0
// Purpose: Equipment / functional location allocation of the task lists in scope.
// Example: The load program assigns each equipment task list to its equipment.
@AbapCatalog.sqlViewName: 'ZEMX_CTLA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Task list allocation (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_TaskListAllocationMig
  as select from ZEMX_I_TaskListObjectAssgmt as src
  association [0..1] to ZEMX_I_TaskListCurrent as _TaskListCurrent on _TaskListCurrent.TaskListType = $projection.TaskListType and _TaskListCurrent.TaskListGroup = $projection.TaskListGroup and _TaskListCurrent.TaskListGroupCounter = $projection.TaskListGroupCounter
{
      @EndUserText.label: 'Task List Type'
  key src.TaskListType         as TaskListType,
      @EndUserText.label: 'Task List Group'
  key src.TaskListGroup        as TaskListGroup,
      @EndUserText.label: 'Task List Group Counter'
  key src.TaskListGroupCounter as TaskListGroupCounter,
      @EndUserText.label: 'Equipment'
  key src.Equipment            as Equipment,
      @EndUserText.label: 'Functional Location'
  key src.FunctionalLocation   as FunctionalLocation,
      @EndUserText.label: 'AdditionalCriteriaCounter'
  key src.AdditionalCriteriaCounter as AdditionalCriteriaCounter,
      @EndUserText.label: 'AssignmentCounter'
  key src.AssignmentCounter as AssignmentCounter,
      @EndUserText.label: 'IsMarkedForDeletion'
      src.IsMarkedForDeletion as IsMarkedForDeletion
}
where _TaskListCurrent.IsMarkedForDeletion = ''
