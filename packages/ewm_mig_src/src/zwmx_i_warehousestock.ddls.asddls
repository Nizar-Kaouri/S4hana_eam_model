// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read WarehouseStock as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V005R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WarehouseStock'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZWMX_I_WarehouseStock
  as select from ZWMX_I_WarehouseStockData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.Warehouse as Warehouse,
  key src.StockIdentity as StockIdentity,
      src.Product as Product,
      src.StorageBin as StorageBin,
      src.Batch as Batch,
      src.Owner as Owner,
      src.EntitledParty as EntitledParty,
      src.StockType as StockType,
      src.SpecialStock as SpecialStock,
      src.ReferenceDocument as ReferenceDocument,
      src.ReferenceItem as ReferenceItem,
      src.HandlingUnit as HandlingUnit,
      src.Quantity as Quantity,
      src.QuantityUnit as QuantityUnit,
      src.InventoryDate as InventoryDate
}
