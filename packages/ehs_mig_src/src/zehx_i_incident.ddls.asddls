// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Modern EHSM incident root only. Basic-info child cardinality, title, location and time-zone calculations remain pending. Preserve root UUID; no guessed join to multiply root rows.
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
  key src.IncidentUUID as IncidentUUID,
      src.IncidentID as IncidentID,
      src.IncidentCategory as IncidentCategory,
      src.IncidentStatus as IncidentStatus,
      src.ReportingRequired as ReportingRequired,
      src.Fatality as Fatality
}
