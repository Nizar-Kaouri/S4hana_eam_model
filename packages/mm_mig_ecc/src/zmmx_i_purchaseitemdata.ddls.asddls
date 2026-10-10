// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PurchaseItemData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] MMX-018: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZMMX_V018'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PurchaseItemData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_I_PurchaseItemData
  as select from ekpo as src
{
  key src.ebeln as PurchaseOrder,
  key src.ebelp as PurchaseOrderItem,
      src.matnr as Material,
      src.werks as Plant,
      src.menge as OrderQuantity,
      src.meins as OrderUnit,
      src.loekz as DeletionFlag,
      src.elikz as DeliveryCompleted,
      src.erekz as FinalInvoice
}
