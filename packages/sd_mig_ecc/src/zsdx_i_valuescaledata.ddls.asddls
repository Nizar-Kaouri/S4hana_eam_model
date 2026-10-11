// ModuPorter SD migration | Release 1.0.0
// Purpose: Read ValueScaleData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZSDX_V016'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ValueScaleData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZSDX_I_ValueScaleData
  as select from konw as src
{
  key src.knumh as ConditionRecord,
  key src.kopos as ConditionItem,
  key src.klfn1 as ScaleLine,
      src.kstbw as ScaleValue,
      src.kbetr as ConditionRate
}
