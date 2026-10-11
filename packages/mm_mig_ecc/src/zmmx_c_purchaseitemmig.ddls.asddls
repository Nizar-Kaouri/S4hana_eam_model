// ModuPorter MM migration | Release 1.0.0
// Purpose: Read PurchaseItemMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V018C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PurchaseItemMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_PurchaseItemMig
  as select from ZMMX_I_PurchaseItem as src
{
  key src.PurchaseOrder as PurchaseOrder,
  key src.PurchaseOrderItem as PurchaseOrderItem,
      src.Material as Material,
      src.Plant as Plant,
      src.OrderQuantity as OrderQuantity,
      src.OrderUnit as OrderUnit,
      src.DeletionFlag as DeletionFlag,
      src.DeliveryCompleted as DeliveryCompleted,
      src.FinalInvoice as FinalInvoice
}
