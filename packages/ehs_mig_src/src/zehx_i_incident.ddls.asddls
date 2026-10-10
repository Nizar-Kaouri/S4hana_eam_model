// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read Incident as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V010R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Incident'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEHX_I_Incident
  as select from ZEHX_I_IncidentData as src
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
