// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
  key src.TaskListType         as TaskListType,
  key src.TaskListGroup        as TaskListGroup,
  key src.TaskListGroupCounter as TaskListGroupCounter,
      src.Equipment            as Equipment,
      src.FunctionalLocation   as FunctionalLocation
}
where _TaskListCurrent.IsMarkedForDeletion = ''
