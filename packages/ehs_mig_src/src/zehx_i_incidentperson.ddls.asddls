// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read IncidentPerson as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V011R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'IncidentPerson'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEHX_I_IncidentPerson
  as select from ZEHX_I_IncidentPersonData as src
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
