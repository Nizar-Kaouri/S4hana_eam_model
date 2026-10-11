// ModuPorter CO migration | Release 1.0.0
// Purpose: Read OrderSettlemenMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V006C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'OrderSettlemenMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZCOX_C_OrderSettlemenMig
  as select from ZCOX_I_OrderSettlemen as src
{
  key src.ObjectNumber as ObjectNumber,
  key src.DistributionRuleGroup as DistributionRuleGroup,
  key src.DistributionRule as DistributionRule,
      src.SettlementType as SettlementType,
      src.SettlementPercentage as SettlementPercentage,
      src.ReceiverCostCenter as ReceiverCostCenter,
      src.ReceiverOrder as ReceiverOrder
}
