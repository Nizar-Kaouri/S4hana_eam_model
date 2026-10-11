// ModuPorter EAM migration | Release 1.0.0
// Purpose: Record count of the work centers delivered by ZEMX_C_WorkCenterMig per Plant, WorkCenterCategoryCode.
// Example: Export this source count view to record the selected extraction population by its dimensions.
@AbapCatalog.sqlViewName: 'ZEMX_CWCN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Work center count (migration)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_WorkCenterMigCount
  as select from ZEMX_C_WorkCenterMig
{
      @EndUserText.label: 'Plant'
  key Plant                  as Plant,
      @EndUserText.label: 'Work Center Category Code'
  key WorkCenterCategoryCode as WorkCenterCategoryCode,
      @EndUserText.label: 'Record Count'
      count( * )             as RecordCount
}
group by Plant, WorkCenterCategoryCode
