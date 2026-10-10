// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ValueScale as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V016R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ValueScale'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZSDX_I_ValueScale
  as select from ZSDX_I_ValueScaleData as src
{
  key src.ConditionRecord as ConditionRecord,
  key src.ConditionItem as ConditionItem,
  key src.ScaleLine as ScaleLine,
      src.ScaleValue as ScaleValue,
      src.ConditionRate as ConditionRate
}
