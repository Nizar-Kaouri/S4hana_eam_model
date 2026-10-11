// ModuPorter SD migration | Release 1.0.0
// Purpose: Read ConditionItem as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V014R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ConditionItem'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZSDX_I_ConditionItem
  as select from ZSDX_B_ConditionItemData as src
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
