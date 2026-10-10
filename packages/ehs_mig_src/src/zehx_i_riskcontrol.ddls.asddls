// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read RiskControl as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V015R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'RiskControl'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEHX_I_RiskControl
  as select from ZEHX_I_RiskControlData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.AssessmentID as AssessmentID,
  key src.Version as Version,
  key src.HazardID as HazardID,
  key src.ControlID as ControlID,
      src.ControlType as ControlType,
      src.Description as Description,
      src.ResponsiblePartner as ResponsiblePartner,
      src.ControlStatus as ControlStatus
}
