// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read HandlingUnitData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMX-007: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZWMX_V007'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'HandlingUnitData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZWMX_I_HandlingUnitData
  as select from zwmx_wms007 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as Warehouse,
  key src.f005 as HandlingUnit,
      src.f006 as ExternalHU,
      src.f007 as ParentHU,
      src.f008 as PackagingProduct,
      src.f009 as GrossWeight,
      src.f010 as NetWeight,
      src.f011 as WeightUnit,
      src.f012 as StorageBin,
      src.f013 as HUStatus
}
