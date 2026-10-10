// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: SortSequence is payload, not an invented key. Confirm exact DDIC key flags before activation.
// Purpose: Read BinSortingMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V002C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BinSortingMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZWMX_C_BinSortingMig
  as select from ZWMX_I_BinSorting as src
{
  key src.Warehouse as Warehouse,
  key src.StorageBin as StorageBin,
  key src.ActivityArea as ActivityArea,
  key src.Activity as Activity,
      src.StorageType as StorageType,
      src.SortSequence as SortSequence
}
