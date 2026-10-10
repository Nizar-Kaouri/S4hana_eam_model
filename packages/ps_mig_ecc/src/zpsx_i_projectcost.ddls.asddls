// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ProjectCost as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V004R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProjectCost'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPSX_I_ProjectCost
  as select from ZPSX_I_ProjectCostData as src
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
