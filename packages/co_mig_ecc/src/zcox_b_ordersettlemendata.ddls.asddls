// ModuPorter CO migration | Release 1.0.0
// Purpose: Read OrderSettlemenData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZCOX_V006'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'OrderSettlemenData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZCOX_B_OrderSettlemenData
  as select from cobrb as src
{
  key src.objnr as ObjectNumber,
  key src.bureg as DistributionRuleGroup,
  key src.lfdnr as DistributionRule,
      src.perbz as SettlementType,
      src.prozs as SettlementPercentage,
      src.kostl as ReceiverCostCenter,
      src.aufnr as ReceiverOrder
}
