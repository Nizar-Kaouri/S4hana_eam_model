// ModuPorter PS migration | Release 1.0.0
// Purpose: Read CommitmentMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V011C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CommitmentMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPSX_C_CommitmentMig
  as select from ZPSX_I_Commitment as src
{
  key src.ObjectNumber as ObjectNumber,
  key src.FiscalYear as FiscalYear,
  key src.ValueType as ValueType,
  key src.Version as Version,
  key src.CostElement as CostElement,
  key src.OriginGroup as OriginGroup,
  key src.BusinessTransaction as BusinessTransaction,
  key src.CommitmentDocument as CommitmentDocument,
  key src.CommitmentItem as CommitmentItem,
      src.TransactionCurrency as TransactionCurrency,
      src.TransactionAmount as TransactionAmount,
      src.ObjectCurrencyAmount as ObjectCurrencyAmount,
      src.ControllingAreaAmount as ControllingAreaAmount
}
