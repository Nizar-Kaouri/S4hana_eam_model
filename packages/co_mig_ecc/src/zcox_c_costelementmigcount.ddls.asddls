// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CostElementMigCount as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V008N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CostElementMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZCOX_C_CostElementMigCount
  as select from ZCOX_C_CostElementMig as src
{
  key src.ChartOfAccounts as ChartOfAccounts,
      count( * ) as RecordCount
}
group by src.ChartOfAccounts
