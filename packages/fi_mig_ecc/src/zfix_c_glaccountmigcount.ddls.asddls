// ModuPorter FI migration | Release 1.0.0
// Purpose: Read GLAccountMigCount as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V001N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'GLAccountMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_GLAccountMigCount
  as select from ZFIX_C_GLAccountMig as src
{
  key src.ChartOfAccounts as ChartOfAccounts,
      count( * ) as RecordCount
}
group by src.ChartOfAccounts
