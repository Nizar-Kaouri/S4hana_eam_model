// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ResCapacityData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMX-003: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZTMX_V003'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ResCapacityData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZTMX_I_ResCapacityData
  as select from ztmx_tms003 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as ResourceID,
  key src.f005 as CapacityID,
      src.f006 as CapacityType,
      src.f007 as CapacityValue,
      src.f008 as CapacityUnit
}
