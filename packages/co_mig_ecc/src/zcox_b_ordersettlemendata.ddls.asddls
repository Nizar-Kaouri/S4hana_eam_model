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
