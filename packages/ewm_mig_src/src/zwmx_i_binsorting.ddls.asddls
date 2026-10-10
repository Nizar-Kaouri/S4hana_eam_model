// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read BinSorting as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V002R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BinSorting'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZWMX_I_BinSorting
  as select from ZWMX_I_BinSortingData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.Warehouse as Warehouse,
  key src.StorageBin as StorageBin,
  key src.SortSequence as SortSequence,
      src.ActivityArea as ActivityArea,
      src.Activity as Activity,
      src.SortDirection as SortDirection
}
