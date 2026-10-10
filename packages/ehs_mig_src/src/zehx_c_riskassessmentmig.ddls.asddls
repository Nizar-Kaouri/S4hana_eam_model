// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read RiskAssessmentMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V013C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'RiskAssessmentMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEHX_C_RiskAssessmentMig
  as select from ZEHX_I_RiskAssessment as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.AssessmentID as AssessmentID,
  key src.Version as Version,
      src.LocationID as LocationID,
      src.ValidityStartDate as ValidityStartDate,
      src.ValidityEndDate as ValidityEndDate,
      src.AssessmentStatus as AssessmentStatus
}
