// ModuPorter PS migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZPSX_83N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'NetworkSettleMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPSX_C_NetworkSettleMig
  as select from ZPSX_I_NetworkSettle as src
{
  key src.ObjectNumber as ObjectNumber,
  key src.DistributionRuleGroup as DistributionRuleGroup,
  key src.DistributionRule as DistributionRule,
      src.SettlementType as SettlementType,
      src.SettlementPercentage as SettlementPercentage,
      src.ReceiverCostCenter as ReceiverCostCenter,
      src.ReceiverOrder as ReceiverOrder,
      src.ReceiverCategory as ReceiverCategory,
      @Semantics.amount.currencyCode: 'SettlementCurrency'
      src.SettlementAmount as SettlementAmount,
      src.SettlementCurrency as SettlementCurrency,
      src.ControllingArea as ControllingArea,
      src.ReceiverCompanyCode as ReceiverCompanyCode,
      src.ReceiverMasterAsset as ReceiverMasterAsset,
      src.ReceiverAsset as ReceiverAsset,
      src.ReceiverWBSInternalID as ReceiverWBSInternalID,
      src.ValidFromFiscalYear as ValidFromFiscalYear,
      src.ValidFromPeriod as ValidFromPeriod,
      src.ValidToFiscalYear as ValidToFiscalYear,
      src.ValidToPeriod as ValidToPeriod
}
