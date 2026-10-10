// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read AnnualBudgetData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] PSX-010: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPSX_V010'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AnnualBudgetData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPSX_I_AnnualBudgetData
  as select from bpja as src
{
  key src.lednr as Ledger,
  key src.objnr as ObjectNumber,
  key src.posit as BudgetItem,
  key src.trgkz as TransactionIndicator,
  key src.wrttp as ValueType,
  key src.versn as Version,
  key src.gjahr as FiscalYear,
      src.wtjhr as AnnualBudgetAmount
}
