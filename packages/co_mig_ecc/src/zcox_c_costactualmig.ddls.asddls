// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CostActualMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V007C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CostActualMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZCOX_C_CostActualMig
  as select from ZCOX_I_CostActual as src
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
