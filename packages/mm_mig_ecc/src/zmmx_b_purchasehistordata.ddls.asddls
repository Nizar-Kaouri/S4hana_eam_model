// ModuPorter MM migration | Release 1.0.0
// Purpose: Read PurchaseHistorData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZMMX_V021'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PurchaseHistorData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_B_PurchaseHistorData
  as select from ekbe as src
{
  key src.ebeln as PurchaseOrder,
  key src.ebelp as PurchaseOrderItem,
  key src.zekkn as AccountAssignmentNumber,
  key src.vgabe as HistoryCategory,
  key src.gjahr as FiscalYear,
  key src.belnr as DocumentNumber,
  key src.buzei as DocumentItem,
      src.budat as PostingDate,
      src.menge as Quantity,
      src.shkzg as DebitCreditCode
}
