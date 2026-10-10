// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read GLAccountTextMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V002C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'GLAccountTextMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_GLAccountTextMig
  as select from ZFIX_I_GLAccountText as src
{
  key src.Language as Language,
  key src.ChartOfAccounts as ChartOfAccounts,
  key src.GLAccount as GLAccount,
      src.GLAccountName as GLAccountName,
      src.GLAccountDescription as GLAccountDescription
}
