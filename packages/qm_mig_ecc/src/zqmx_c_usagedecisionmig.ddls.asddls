// ModuPorter QM migration | Release 1.0.0
// Purpose: Read UsageDecisionMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V002C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'UsageDecisionMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZQMX_C_UsageDecisionMig
  as select from ZQMX_I_UsageDecision as src
{
  key src.InspectionLot as InspectionLot,
  key src.UsageDecisionType as UsageDecisionType,
  key src.UsageDecisionCounter as UsageDecisionCounter,
      src.UsageDecisionCode as UsageDecisionCode,
      src.UsageDecisionCodeGroup as UsageDecisionCodeGroup,
      src.UsageDecisionDate as UsageDecisionDate
}
