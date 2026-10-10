// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read AnnualBudget as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V010R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AnnualBudget'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPSX_I_AnnualBudget
  as select from ZPSX_I_AnnualBudgetData as src
{
  key src.Ledger as Ledger,
  key src.ObjectNumber as ObjectNumber,
  key src.BudgetItem as BudgetItem,
  key src.TransactionIndicator as TransactionIndicator,
  key src.ValueType as ValueType,
  key src.Version as Version,
  key src.FiscalYear as FiscalYear,
      src.AnnualBudgetAmount as AnnualBudgetAmount
}
