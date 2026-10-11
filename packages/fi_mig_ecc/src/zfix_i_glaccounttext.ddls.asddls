// ModuPorter FI migration | Release 1.0.0
// Purpose: Read GLAccountText as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V002R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'GLAccountText'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_GLAccountText
  as select from ZFIX_B_GLAccountTextData as src
{
  key src.Language as Language,
  key src.ChartOfAccounts as ChartOfAccounts,
  key src.GLAccount as GLAccount,
      src.GLAccountName as GLAccountName,
      src.GLAccountDescription as GLAccountDescription
}
