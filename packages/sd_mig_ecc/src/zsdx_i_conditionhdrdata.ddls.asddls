// ModuPorter SD migration | Release 1.0.0
// Purpose: Read ConditionHdrData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZSDX_V013'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ConditionHdrData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZSDX_I_ConditionHdrData
  as select from konh as src
{
  key src.knumh as ConditionRecord,
      src.kvewe as ConditionUsage,
      src.kotabnr as ConditionTableNumber,
      src.kappl as Application,
      src.kschl as ConditionType,
      src.datab as ValidityStartDate,
      src.datbi as ValidityEndDate
}
