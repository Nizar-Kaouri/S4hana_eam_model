// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read HandlingUnit as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V007R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'HandlingUnit'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZWMX_I_HandlingUnit
  as select from ZWMX_I_HandlingUnitData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.Warehouse as Warehouse,
  key src.HandlingUnit as HandlingUnit,
      src.ExternalHU as ExternalHU,
      src.ParentHU as ParentHU,
      src.PackagingProduct as PackagingProduct,
      src.GrossWeight as GrossWeight,
      src.NetWeight as NetWeight,
      src.WeightUnit as WeightUnit,
      src.StorageBin as StorageBin,
      src.HUStatus as HUStatus
}
