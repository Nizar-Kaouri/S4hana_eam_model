// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read IncidentCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] EHT-010: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'IncidentCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZEHT_I_IncidentCompare
  as select from zeht_eht010 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as IncidentID,
      src.f005 as IncidentType,
      src.f006 as LocationID,
      src.f007 as OccurredAtUTC,
      src.f008 as TimeZone,
      src.f009 as IncidentStatus,
      src.f010 as Description
}
