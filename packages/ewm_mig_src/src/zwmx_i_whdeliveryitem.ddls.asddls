// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read WhDeliveryItem as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V013R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WhDeliveryItem'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZWMX_I_WhDeliveryItem
  as select from ZWMX_I_WhDeliveryItemData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.Warehouse as Warehouse,
  key src.DeliveryID as DeliveryID,
  key src.DeliveryItem as DeliveryItem,
      src.Product as Product,
      src.Batch as Batch,
      src.Quantity as Quantity,
      src.QuantityUnit as QuantityUnit,
      src.HandlingUnit as HandlingUnit,
      src.ReferenceDocument as ReferenceDocument,
      src.ReferenceItem as ReferenceItem
}
