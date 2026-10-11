// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Modern EHSM incident root only. Basic-info child cardinality, title, location and time-zone calculations remain pending. Preserve root UUID; no guessed join to multiply root rows.
// Purpose: Read IncidentData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] EHX-010: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZEHX_V010'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'IncidentData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEHX_B_IncidentData
  as select from ehhssd_inc_root as src
{
  key src.db_key as IncidentUUID,
      src.id as IncidentID,
      src.category as IncidentCategory,
      src.status as IncidentStatus,
      src.report_req_ts as ReportingRequired,
      src.fatality_ts as Fatality
}
