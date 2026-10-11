// ModuPorter PS migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZPSX_79N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WBSSettle'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPSX_I_WBSSettle
  as select from ZPSX_B_WBSSettleData as ch
{
  key ch.ObjectNumber as ObjectNumber,
  key ch.DistributionRuleGroup as DistributionRuleGroup,
  key ch.DistributionRule as DistributionRule,
      ch.SettlementType as SettlementType,
      ch.SettlementPercentage as SettlementPercentage,
      ch.ReceiverCostCenter as ReceiverCostCenter,
      ch.ReceiverOrder as ReceiverOrder,
      ch.ReceiverCategory as ReceiverCategory,
      @Semantics.amount.currencyCode: 'SettlementCurrency'
      ch.SettlementAmount as SettlementAmount,
      ch.SettlementCurrency as SettlementCurrency,
      ch.ControllingArea as ControllingArea,
      ch.ReceiverCompanyCode as ReceiverCompanyCode,
      ch.ReceiverMasterAsset as ReceiverMasterAsset,
      ch.ReceiverAsset as ReceiverAsset,
      ch.ReceiverWBSInternalID as ReceiverWBSInternalID,
      ch.ValidFromFiscalYear as ValidFromFiscalYear,
      ch.ValidFromPeriod as ValidFromPeriod,
      ch.ValidToFiscalYear as ValidToFiscalYear,
      ch.ValidToPeriod as ValidToPeriod
}
