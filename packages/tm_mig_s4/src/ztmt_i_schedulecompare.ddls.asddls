// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ScheduleCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMT-006: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ScheduleCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZTMT_I_ScheduleCompare
  as select from ztmt_tmt006 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as ScheduleID,
  key src.f005 as Version,
      src.f006 as Description,
      src.f007 as TransportMode,
      src.f008 as Carrier,
      src.f009 as ValidityStartDate,
      src.f010 as ValidityEndDate
}
