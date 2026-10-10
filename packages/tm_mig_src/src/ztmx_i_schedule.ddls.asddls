// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read Schedule as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V006R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Schedule'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZTMX_I_Schedule
  as select from ZTMX_I_ScheduleData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.ScheduleID as ScheduleID,
  key src.Version as Version,
      src.Description as Description,
      src.TransportMode as TransportMode,
      src.Carrier as Carrier,
      src.ValidityStartDate as ValidityStartDate,
      src.ValidityEndDate as ValidityEndDate
}
