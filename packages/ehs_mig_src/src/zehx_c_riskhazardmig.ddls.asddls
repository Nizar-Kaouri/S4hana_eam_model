// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read RiskHazardMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V014C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'RiskHazardMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEHX_C_RiskHazardMig
  as select from ZEHX_I_RiskHazard as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.AssessmentID as AssessmentID,
  key src.Version as Version,
  key src.HazardID as HazardID,
      src.HazardType as HazardType,
      src.Likelihood as Likelihood,
      src.Severity as Severity,
      src.RiskRating as RiskRating,
      src.RatingScheme as RatingScheme
}
