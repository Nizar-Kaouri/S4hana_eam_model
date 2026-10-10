// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read IncidentPersonMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V011C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'IncidentPersonMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEHX_C_IncidentPersonMig
  as select from ZEHX_I_IncidentPerson as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.IncidentID as IncidentID,
  key src.PersonRole as PersonRole,
  key src.PersonID as PersonID,
      src.BusinessPartner as BusinessPartner,
      src.RestrictedRecordReference as RestrictedRecordReference
}
