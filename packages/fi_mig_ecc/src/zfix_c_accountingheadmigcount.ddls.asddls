// ModuPorter FI migration | Release 1.0.0
// Purpose: Read AccountingHeadMigCount as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V010N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AccountingHeadMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_AccountingHeadMigCount
  as select from ZFIX_C_AccountingHeadMig as src
{
  key src.CompanyCode as CompanyCode,
      count( * ) as RecordCount
}
group by src.CompanyCode
