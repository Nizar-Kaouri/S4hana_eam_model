// ModuPorter MM migration | Release 1.0.0
// Purpose: Read PurchaseSchedu as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V019R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PurchaseSchedu'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_PurchaseSchedu
  as select from ZMMX_B_PurchaseScheduData as src
{
  key src.PurchaseOrder as PurchaseOrder,
  key src.PurchaseOrderItem as PurchaseOrderItem,
  key src.ScheduleLine as ScheduleLine,
      src.DeliveryDate as DeliveryDate,
      src.ScheduledQuantity as ScheduledQuantity,
      src.ReceivedQuantity as ReceivedQuantity
}
