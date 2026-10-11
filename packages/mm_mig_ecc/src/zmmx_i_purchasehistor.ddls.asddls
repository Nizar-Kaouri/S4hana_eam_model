// ModuPorter MM migration | Release 1.0.0
// Purpose: Read PurchaseHistor as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V021R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PurchaseHistor'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_PurchaseHistor
  as select from ZMMX_I_PurchaseHistorData as src
{
  key src.PurchaseOrder as PurchaseOrder,
  key src.PurchaseOrderItem as PurchaseOrderItem,
  key src.AccountAssignmentNumber as AccountAssignmentNumber,
  key src.HistoryCategory as HistoryCategory,
  key src.FiscalYear as FiscalYear,
  key src.DocumentNumber as DocumentNumber,
  key src.DocumentItem as DocumentItem,
      src.PostingDate as PostingDate,
      src.Quantity as Quantity,
      src.DebitCreditCode as DebitCreditCode
}
