// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read TaskConfirmMigCount as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V010N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'TaskConfirmMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZWMX_C_TaskConfirmMigCount
  as select from ZWMX_C_TaskConfirmMig as src
{
  key src.Warehouse as Warehouse,
      count( * ) as RecordCount
}
group by src.Warehouse
