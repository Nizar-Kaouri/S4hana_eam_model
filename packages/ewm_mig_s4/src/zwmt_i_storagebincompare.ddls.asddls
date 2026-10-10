// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read StorageBinCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMT-001: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'StorageBinCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZWMT_I_StorageBinCompare
  as select from zwmt_wmt001 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as Warehouse,
  key src.f005 as StorageBin,
      src.f006 as StorageType,
      src.f007 as StorageSection,
      src.f008 as BinType,
      src.f009 as Capacity,
      src.f010 as CapacityUnit,
      src.f011 as Blocked
}
