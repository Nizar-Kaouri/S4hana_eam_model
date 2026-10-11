// ModuPorter SD migration | Release 1.0.0
// Purpose: Read ConditionItemMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V014C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ConditionItemMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZSDX_C_ConditionItemMig
  as select from ZSDX_I_ConditionItem as src
{
  key src.ConditionRecord as ConditionRecord,
  key src.ConditionItem as ConditionItem,
      src.CalculationType as CalculationType,
      src.ConditionRate as ConditionRate,
      src.ConditionCurrency as ConditionCurrency,
      src.PricingUnit as PricingUnit,
      src.ConditionUnit as ConditionUnit,
      src.DeletionFlag as DeletionFlag
}
