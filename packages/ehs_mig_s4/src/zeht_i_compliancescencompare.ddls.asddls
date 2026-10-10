// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ComplianceScenCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] EHT-020: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ComplianceScenCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZEHT_I_ComplianceScenCompare
  as select from zeht_eht020 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as ScenarioID,
  key src.f005 as Version,
      src.f006 as LocationID,
      src.f007 as Description,
      src.f008 as ScenarioStatus
}
