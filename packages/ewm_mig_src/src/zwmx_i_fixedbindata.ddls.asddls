// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FixedBinData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMX-004: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZWMX_V004'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FixedBinData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZWMX_I_FixedBinData
  as select from zwmx_wms004 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as Warehouse,
  key src.f005 as Product,
  key src.f006 as EntitledParty,
  key src.f007 as StorageType,
  key src.f008 as StorageBin,
      src.f009 as MinimumQuantity,
      src.f010 as MaximumQuantity,
      src.f011 as QuantityUnit
}
