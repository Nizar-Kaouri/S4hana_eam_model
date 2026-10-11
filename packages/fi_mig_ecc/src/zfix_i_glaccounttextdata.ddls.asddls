// ModuPorter FI migration | Release 1.0.0
// Purpose: Read GLAccountTextData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFIX_V002'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'GLAccountTextData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_I_GLAccountTextData
  as select from skat as src
{
  key src.spras as Language,
  key src.ktopl as ChartOfAccounts,
  key src.saknr as GLAccount,
      src.txt20 as GLAccountName,
      src.txt50 as GLAccountDescription
}
