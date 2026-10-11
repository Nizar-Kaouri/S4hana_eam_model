// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: EWM storage bins; LE-WM LAGP is a different model. Capacity fields await validated unit semantics.
// Purpose: Read StorageBinMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V001C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'StorageBinMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZWMX_C_StorageBinMig
  as select from ZWMX_I_StorageBin as src
{
  key src.Warehouse as Warehouse,
  key src.StorageBin as StorageBin,
      src.StorageType as StorageType,
      src.StorageSection as StorageSection,
      src.BinType as BinType,
      src.RemovalBlocked as RemovalBlocked,
      src.PutawayBlocked as PutawayBlocked,
      src.InventoryBlocked as InventoryBlocked
}
