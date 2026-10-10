// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read RiskControlData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] EHX-015: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZEHX_V015'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'RiskControlData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEHX_I_RiskControlData
  as select from zehx_ehs015 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as AssessmentID,
  key src.f005 as Version,
  key src.f006 as HazardID,
  key src.f007 as ControlID,
      src.f008 as ControlType,
      src.f009 as Description,
      src.f010 as ResponsiblePartner,
      src.f011 as ControlStatus
}
