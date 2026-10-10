// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read WarehouseTask as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V009R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WarehouseTask'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZWMX_I_WarehouseTask
  as select from ZWMX_I_WarehouseTaskData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.Warehouse as Warehouse,
  key src.WarehouseTask as WarehouseTask,
      src.WarehouseOrder as WarehouseOrder,
      src.Product as Product,
      src.SourceBin as SourceBin,
      src.DestinationBin as DestinationBin,
      src.HandlingUnit as HandlingUnit,
      src.PlannedQuantity as PlannedQuantity,
      src.QuantityUnit as QuantityUnit,
      src.ProcessType as ProcessType,
      src.TaskStatus as TaskStatus
}
