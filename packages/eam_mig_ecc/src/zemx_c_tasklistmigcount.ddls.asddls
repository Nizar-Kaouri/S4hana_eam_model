// ModuPorter EAM migration | Release 1.0.0
// Purpose: Record count of the task lists delivered by ZEMX_C_TaskListMig per TaskListType, Plant.
// Example: Export this source count view to record the selected extraction population by its dimensions.
@AbapCatalog.sqlViewName: 'ZEMX_CTLN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Task list count (migration)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_TaskListMigCount
  as select from ZEMX_C_TaskListMig
{
      @EndUserText.label: 'Task List Type'
  key TaskListType as TaskListType,
      @EndUserText.label: 'Plant'
  key Plant        as Plant,
      @EndUserText.label: 'Record Count'
      count( * )   as RecordCount
}
group by TaskListType, Plant
