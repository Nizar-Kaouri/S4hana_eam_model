// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PurchaseHistorMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V021C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PurchaseHistorMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_PurchaseHistorMig
  as select from ZMMX_I_PurchaseHistor as src
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
