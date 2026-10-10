// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ComplianceLinkMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V021C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ComplianceLinkMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEHX_C_ComplianceLinkMig
  as select from ZEHX_I_ComplianceLink as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.ScenarioID as ScenarioID,
  key src.Version as Version,
  key src.RequirementID as RequirementID,
  key src.RequirementVersion as RequirementVersion,
      src.ClassifierID as ClassifierID,
      src.PropertyID as PropertyID
}
