// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read IncidentActionCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] EHT-012: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'IncidentActionCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZEHT_I_IncidentActionCompare
  as select from zeht_eht012 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as IncidentID,
  key src.f005 as ActionID,
      src.f006 as ActionType,
      src.f007 as ResponsiblePartner,
      src.f008 as DueDate,
      src.f009 as ActionStatus
}
