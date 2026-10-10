// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read RoutingHeaderMigCount as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V011N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'RoutingHeaderMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPPX_C_RoutingHeaderMigCount
  as select from ZPPX_C_RoutingHeaderMig as src
{
  key src.TaskListType as TaskListType,
      count( * ) as RecordCount
}
group by src.TaskListType
