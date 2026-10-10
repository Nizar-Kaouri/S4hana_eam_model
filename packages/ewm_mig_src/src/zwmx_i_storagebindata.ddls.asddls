// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: EWM storage bins; LE-WM LAGP is a different model. Capacity fields await validated unit semantics.
// Purpose: Read StorageBinData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMX-001: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZWMX_V001'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'StorageBinData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZWMX_I_StorageBinData
  as select from /scwm/lagp as src
{
  key src.lgnum as Warehouse,
  key src.lgpla as StorageBin,
      src.lgtyp as StorageType,
      src.lgber as StorageSection,
      src.lptyp as BinType,
      src.skzua as RemovalBlocked,
      src.skzue as PutawayBlocked,
      src.skzsi as InventoryBlocked
}
