// ModuPorter PS migration | Release 1.0.0
// Purpose: Read OverallBudgetData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPSX_V009'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'OverallBudgetData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPSX_B_OverallBudgetData
  as select from bpge as src
{
  key src.lednr as Ledger,
  key src.objnr as ObjectNumber,
  key src.posit as BudgetItem,
  key src.trgkz as TransactionIndicator,
  key src.wrttp as ValueType,
  key src.versn as Version,
      src.wlges as OverallBudgetAmount
}
