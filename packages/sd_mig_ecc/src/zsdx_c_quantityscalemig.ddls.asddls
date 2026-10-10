// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read QuantityScaleMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V015C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'QuantityScaleMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZSDX_C_QuantityScaleMig
  as select from ZSDX_I_QuantityScale as src
{
  key src.ConditionRecord as ConditionRecord,
  key src.ConditionItem as ConditionItem,
  key src.ScaleLine as ScaleLine,
      src.ScaleQuantity as ScaleQuantity,
      src.ConditionRate as ConditionRate
}
