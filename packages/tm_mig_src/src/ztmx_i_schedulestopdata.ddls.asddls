// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ScheduleStopData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMX-007: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZTMX_V007'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ScheduleStopData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZTMX_I_ScheduleStopData
  as select from ztmx_tms007 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as ScheduleID,
  key src.f005 as Version,
  key src.f006 as StopID,
      src.f007 as LocationID,
      src.f008 as Sequence,
      src.f009 as ArrivalLocal,
      src.f010 as DepartureLocal,
      src.f011 as TimeZone
}
