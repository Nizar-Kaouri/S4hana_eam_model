// ModuPorter PP migration | Release 1.0.0
// Purpose: Read ProductionOperMigCount as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V004N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProductionOperMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPPX_C_ProductionOperMigCount
  as select from ZPPX_C_ProductionOperMig as src
{
  key src.OperationRoutingNumber as OperationRoutingNumber,
      count( * ) as RecordCount
}
group by src.OperationRoutingNumber
