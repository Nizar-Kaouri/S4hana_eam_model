// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PurchaseScheduData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] MMX-019: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZMMX_V019'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PurchaseScheduData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_I_PurchaseScheduData
  as select from eket as src
{
  key src.ebeln as PurchaseOrder,
  key src.ebelp as PurchaseOrderItem,
  key src.etenr as ScheduleLine,
      src.eindt as DeliveryDate,
      src.menge as ScheduledQuantity,
      src.wemng as ReceivedQuantity
}
