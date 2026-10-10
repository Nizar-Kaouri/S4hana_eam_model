// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightUnitStoCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMT-013: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightUnitStoCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZTMT_I_FreightUnitStoCompare
  as select from ztmt_tmt013 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as FreightUnitID,
  key src.f005 as StopID,
      src.f006 as LocationID,
      src.f007 as Sequence,
      src.f008 as StopRole,
      src.f009 as PlannedAtUTC,
      src.f010 as TimeZone
}
