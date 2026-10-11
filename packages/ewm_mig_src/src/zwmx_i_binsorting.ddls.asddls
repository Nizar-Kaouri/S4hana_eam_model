// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: SortSequence is payload, not an invented key. Confirm exact DDIC key flags before activation.
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
  as select from ZWMX_B_BinSortingData as src
{
  key src.Warehouse as Warehouse,
  key src.StorageBin as StorageBin,
  key src.ActivityArea as ActivityArea,
  key src.Activity as Activity,
      src.StorageType as StorageType,
      src.SortSequence as SortSequence
}
