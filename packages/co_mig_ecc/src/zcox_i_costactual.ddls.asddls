// ModuPorter CO migration | Release 1.0.0
// Purpose: Read CostActual as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V007R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CostActual'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZCOX_I_CostActual
  as select from ZCOX_B_CostActualData as src
{
  key src.ControllingArea as ControllingArea,
  key src.COAccountingDocument as COAccountingDocument,
  key src.COAccountingDocumentItem as COAccountingDocumentItem,
      src.FiscalYear as FiscalYear,
      src.ObjectNumber as ObjectNumber,
      src.CostElement as CostElement,
      src.ValueType as ValueType,
      src.BusinessTransaction as BusinessTransaction,
      src.TransactionAmount as TransactionAmount,
      src.TransactionCurrency as TransactionCurrency
}
