// ModuPorter SD migration | Release 1.0.0
// Purpose: Read ConditionItemData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZSDX_V014'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ConditionItemData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZSDX_I_ConditionItemData
  as select from konp as src
{
  key src.knumh as ConditionRecord,
  key src.kopos as ConditionItem,
      src.krech as CalculationType,
      src.kbetr as ConditionRate,
      src.konwa as ConditionCurrency,
      src.kpein as PricingUnit,
      src.kmein as ConditionUnit,
      src.loevm_ko as DeletionFlag
}
