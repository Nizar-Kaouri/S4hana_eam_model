// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read StorageBin as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V001R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'StorageBin'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZWMX_I_StorageBin
  as select from ZWMX_I_StorageBinData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.Warehouse as Warehouse,
  key src.StorageBin as StorageBin,
      src.StorageType as StorageType,
      src.StorageSection as StorageSection,
      src.BinType as BinType,
      src.Capacity as Capacity,
      src.CapacityUnit as CapacityUnit,
      src.Blocked as Blocked
}
