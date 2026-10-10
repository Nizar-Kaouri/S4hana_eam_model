// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ConditionItem as source candidates; approve the key-date population before posting.
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
  as select from ZSDX_I_ConditionItemData as src
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
