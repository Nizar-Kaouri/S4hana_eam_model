// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ComplianceLink as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V021R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ComplianceLink'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEHX_I_ComplianceLink
  as select from ZEHX_I_ComplianceLinkData as src
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
