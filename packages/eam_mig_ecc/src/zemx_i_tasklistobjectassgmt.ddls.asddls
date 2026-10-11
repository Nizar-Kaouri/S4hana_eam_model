// ModuPorter EAM migration | Release 1.0.0
// Purpose: Task-list object allocation change states; customer resolves validity at cutover.
// Example: Find the task lists of equipment 10000001.
@AbapCatalog.sqlViewName: 'ZEMX_EAPL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Task list object assignment'
@ObjectModel.representativeKey: 'TaskListGroupCounter'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #COMPOSITE
define view ZEMX_I_TaskListObjectAssgmt
  as select from ZEMX_I_EquipTaskListAsgmt as src
{
      @EndUserText.label: 'TaskListType'
  key src.TaskListType as TaskListType,
      @EndUserText.label: 'TaskListGroup'
  key src.TaskListGroup as TaskListGroup,
      @EndUserText.label: 'TaskListGroupCounter'
  key src.TaskListGroupCounter as TaskListGroupCounter,
      @EndUserText.label: 'Equipment'
  key src.Equipment as Equipment,
      @EndUserText.label: 'FunctionalLocation'
  key src.FunctionalLocation as FunctionalLocation,
      @EndUserText.label: 'AdditionalCriteriaCounter'
  key src.AdditionalCriteriaCounter as AdditionalCriteriaCounter,
      @EndUserText.label: 'AssignmentCounter'
  key src.AssignmentCounter as AssignmentCounter,
      @EndUserText.label: 'IsMarkedForDeletion'
      src.IsMarkedForDeletion as IsMarkedForDeletion
}
union all
  select from ZEMX_I_FuncTaskListAsgmt as src
{
      @EndUserText.label: 'TaskListType'
  key src.TaskListType as TaskListType,
      @EndUserText.label: 'TaskListGroup'
  key src.TaskListGroup as TaskListGroup,
      @EndUserText.label: 'TaskListGroupCounter'
  key src.TaskListGroupCounter as TaskListGroupCounter,
      @EndUserText.label: 'Equipment'
  key src.Equipment as Equipment,
      @EndUserText.label: 'FunctionalLocation'
  key src.FunctionalLocation as FunctionalLocation,
      @EndUserText.label: 'AdditionalCriteriaCounter'
  key src.AdditionalCriteriaCounter as AdditionalCriteriaCounter,
      @EndUserText.label: 'AssignmentCounter'
  key src.AssignmentCounter as AssignmentCounter,
      @EndUserText.label: 'IsMarkedForDeletion'
      src.IsMarkedForDeletion as IsMarkedForDeletion
}
