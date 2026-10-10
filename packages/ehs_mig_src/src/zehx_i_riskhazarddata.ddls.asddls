// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read RiskHazardData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] EHX-014: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZEHX_V014'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'RiskHazardData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEHX_I_RiskHazardData
  as select from zehx_ehs014 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as AssessmentID,
  key src.f005 as Version,
  key src.f006 as HazardID,
      src.f007 as HazardType,
      src.f008 as Likelihood,
      src.f009 as Severity,
      src.f010 as RiskRating,
      src.f011 as RatingScheme
}
