// ModuPorter EAM migration | Release 1.0.0
// Purpose: Latest recorded operation state, including deletion states; cutover effectivity still requires verification.
// Example: Join the counter back to its own table wrapper before applying deletion scope.
@AbapCatalog.sqlViewName: 'ZEMX_TLOL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Latest recorded task list operation state'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_TaskListOpLatest
  as select from ZEMX_I_TaskListOpDetail as src
{
      @EndUserText.label: 'Task List Type'
  key src.TaskListType as TaskListType,
      @EndUserText.label: 'Task List Group'
  key src.TaskListGroup as TaskListGroup,
      @EndUserText.label: 'Task List Operation Internal Id'
  key src.TaskListOperationInternalId as TaskListOperationInternalId,
      @EndUserText.label: 'Task List Op Version Counter'
      max( src.TaskListOpVersionCounter ) as TaskListOpVersionCounter
}
group by src.TaskListType, src.TaskListGroup, src.TaskListOperationInternalId
