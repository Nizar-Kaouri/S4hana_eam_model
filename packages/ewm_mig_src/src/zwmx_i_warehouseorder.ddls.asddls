// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read WarehouseOrder as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V011R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WarehouseOrder'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZWMX_I_WarehouseOrder
  as select from ZWMX_I_WarehouseOrderData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.Warehouse as Warehouse,
  key src.WarehouseOrder as WarehouseOrder,
      src.ActivityArea as ActivityArea,
      src.Queue as Queue,
      src.Resource as Resource,
      src.OrderStatus as OrderStatus,
      src.CreatedAtUTC as CreatedAtUTC
}
