// ModuPorter PS migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZPSX_81N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NetworkSettleData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPSX_B_NetworkSettleData
  as select from cobrb as src
{
  key src.objnr as ObjectNumber,
  key src.bureg as DistributionRuleGroup,
  key src.lfdnr as DistributionRule,
      src.perbz as SettlementType,
      src.prozs as SettlementPercentage,
      src.kostl as ReceiverCostCenter,
      src.aufnr as ReceiverOrder,
      src.konty as ReceiverCategory,
      @Semantics.amount.currencyCode: 'SettlementCurrency'
      src.betrr as SettlementAmount,
      src.bwaer as SettlementCurrency,
      src.kokrs as ControllingArea,
      src.bukrs as ReceiverCompanyCode,
      src.anln1 as ReceiverMasterAsset,
      src.anln2 as ReceiverAsset,
      src.pspnr as ReceiverWBSInternalID,
      src.gabja as ValidFromFiscalYear,
      src.gabpe as ValidFromPeriod,
      src.gbisj as ValidToFiscalYear,
      src.gbisp as ValidToPeriod
}
