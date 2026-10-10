// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ComplianceScen as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V020R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ComplianceScen'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEHX_I_ComplianceScen
  as select from ZEHX_I_ComplianceScenData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.ScenarioID as ScenarioID,
  key src.Version as Version,
      src.LocationID as LocationID,
      src.Description as Description,
      src.ScenarioStatus as ScenarioStatus
}
