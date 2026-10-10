// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ScheduleStop as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V007R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ScheduleStop'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZTMX_I_ScheduleStop
  as select from ZTMX_I_ScheduleStopData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.ScheduleID as ScheduleID,
  key src.Version as Version,
  key src.StopID as StopID,
      src.LocationID as LocationID,
      src.Sequence as Sequence,
      src.ArrivalLocal as ArrivalLocal,
      src.DepartureLocal as DepartureLocal,
      src.TimeZone as TimeZone
}
