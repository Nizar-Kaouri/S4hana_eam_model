// ModuPorter SD migration | Release 1.0.0
// Purpose: Read ValueScaleMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V016C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ValueScaleMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZSDX_C_ValueScaleMig
  as select from ZSDX_I_ValueScale as src
{
  key src.ConditionRecord as ConditionRecord,
  key src.ConditionItem as ConditionItem,
  key src.ScaleLine as ScaleLine,
      src.ScaleValue as ScaleValue,
      src.ConditionRate as ConditionRate
}
