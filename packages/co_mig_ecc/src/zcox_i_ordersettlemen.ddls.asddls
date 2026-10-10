// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read OrderSettlemen as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V006R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'OrderSettlemen'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZCOX_I_OrderSettlemen
  as select from ZCOX_I_OrderSettlemenData as src
{
  key src.ObjectNumber as ObjectNumber,
  key src.DistributionRuleGroup as DistributionRuleGroup,
  key src.DistributionRule as DistributionRule,
      src.SettlementType as SettlementType,
      src.SettlementPercentage as SettlementPercentage,
      src.ReceiverCostCenter as ReceiverCostCenter,
      src.ReceiverOrder as ReceiverOrder
}
