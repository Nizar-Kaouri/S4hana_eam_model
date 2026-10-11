// ModuPorter FI migration | Release 1.0.0
// Purpose: Read GLAccountMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V001C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'GLAccountMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_GLAccountMig
  as select from ZFIX_I_GLAccount as src
{
  key src.ChartOfAccounts as ChartOfAccounts,
  key src.GLAccount as GLAccount,
      src.AccountGroup as AccountGroup,
      src.BalanceSheetAccount as BalanceSheetAccount,
      src.DeletionFlag as DeletionFlag
}
