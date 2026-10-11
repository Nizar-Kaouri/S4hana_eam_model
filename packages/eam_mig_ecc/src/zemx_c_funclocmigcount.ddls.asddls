// ModuPorter EAM migration | Release 1.0.0
// Purpose: Record count of the functional locations delivered by ZEMX_C_FuncLocMig per MaintenancePlanningPlant, FunctionalLocationCategory.
// Example: Export this source count view to record the selected extraction population by its dimensions.
@AbapCatalog.sqlViewName: 'ZEMX_CFLN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Functional location count (migration)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_FuncLocMigCount
  as select from ZEMX_C_FuncLocMig
{
      @EndUserText.label: 'Maintenance Planning Plant'
  key MaintenancePlanningPlant   as MaintenancePlanningPlant,
      @EndUserText.label: 'Functional Location Category'
  key FunctionalLocationCategory as FunctionalLocationCategory,
      @EndUserText.label: 'Record Count'
      count( * )                 as RecordCount
}
group by MaintenancePlanningPlant, FunctionalLocationCategory
