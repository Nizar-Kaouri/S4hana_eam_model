// ModuPorter FI migration | Release 1.0.0
// Purpose: Read GLAccount as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V001R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'GLAccount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_GLAccount
  as select from ZFIX_I_GLAccountData as src
{
  key src.ChartOfAccounts as ChartOfAccounts,
  key src.GLAccount as GLAccount,
      src.AccountGroup as AccountGroup,
      src.BalanceSheetAccount as BalanceSheetAccount,
      src.DeletionFlag as DeletionFlag
}
