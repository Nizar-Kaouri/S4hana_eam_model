// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read UsageDecision as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V002R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'UsageDecision'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZQMX_I_UsageDecision
  as select from ZQMX_I_UsageDecisionData as src
{
  key src.InspectionLot as InspectionLot,
  key src.UsageDecisionType as UsageDecisionType,
  key src.UsageDecisionCounter as UsageDecisionCounter,
      src.UsageDecisionCode as UsageDecisionCode,
      src.UsageDecisionCodeGroup as UsageDecisionCodeGroup,
      src.UsageDecisionDate as UsageDecisionDate
}
