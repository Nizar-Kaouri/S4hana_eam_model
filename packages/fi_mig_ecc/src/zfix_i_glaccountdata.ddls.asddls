// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read GLAccountData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FIX-001: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFIX_V001'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'GLAccountData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_I_GLAccountData
  as select from ska1 as src
{
  key src.ktopl as ChartOfAccounts,
  key src.saknr as GLAccount,
      src.ktoks as AccountGroup,
      src.xbilk as BalanceSheetAccount,
      src.xloev as DeletionFlag
}
