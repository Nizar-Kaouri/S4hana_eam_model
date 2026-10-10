// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightStageCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMT-017: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightStageCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZTMT_I_FreightStageCompare
  as select from ztmt_tmt017 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as FreightOrderID,
  key src.f005 as StageID,
      src.f006 as FromStop,
      src.f007 as ToStop,
      src.f008 as Distance,
      src.f009 as DistanceUnit,
      src.f010 as TransportMode
}
