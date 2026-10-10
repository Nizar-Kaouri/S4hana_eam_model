// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read IncidentMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V010C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'IncidentMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEHX_C_IncidentMig
  as select from ZEHX_I_Incident as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.IncidentID as IncidentID,
      src.IncidentType as IncidentType,
      src.LocationID as LocationID,
      src.OccurredAtUTC as OccurredAtUTC,
      src.TimeZone as TimeZone,
      src.IncidentStatus as IncidentStatus,
      src.Description as Description
}
