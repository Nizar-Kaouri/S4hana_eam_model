// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FixedBin as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V004R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FixedBin'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZWMX_I_FixedBin
  as select from ZWMX_I_FixedBinData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.Warehouse as Warehouse,
  key src.Product as Product,
  key src.EntitledParty as EntitledParty,
  key src.StorageType as StorageType,
  key src.StorageBin as StorageBin,
      src.MinimumQuantity as MinimumQuantity,
      src.MaximumQuantity as MaximumQuantity,
      src.QuantityUnit as QuantityUnit
}
