// ModuPorter PS migration | Release 1.0.0
// Purpose: Read AnnualBudgetMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V010C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AnnualBudgetMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPSX_C_AnnualBudgetMig
  as select from ZPSX_I_AnnualBudget as src
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
