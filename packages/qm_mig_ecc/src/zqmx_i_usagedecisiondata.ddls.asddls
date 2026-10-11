// ModuPorter QM migration | Release 1.0.0
// Purpose: Read UsageDecisionData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZQMX_V002'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'UsageDecisionData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZQMX_I_UsageDecisionData
  as select from qave as src
{
  key src.prueflos as InspectionLot,
  key src.kzart as UsageDecisionType,
  key src.zaehler as UsageDecisionCounter,
      src.vcode as UsageDecisionCode,
      src.vcodegrp as UsageDecisionCodeGroup,
      src.vdatum as UsageDecisionDate
}
