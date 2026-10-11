// ModuPorter EAM migration | Release 1.0.0
// Purpose: OrderSettlement source data
// Example: Export the selected migration scope; validate keys and row counts before loading.
// Compatibility note: Confirm COBRB keys, all selected fields and meanings on the source release; posting-interface targets are provisional.
@AbapCatalog.sqlViewName: 'ZEMX_N7B'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'OrderSettlement source data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_OrderSettlementData
  as select from cobrb as t
{
      @EndUserText.label: 'Object Number'
  key t.objnr as ObjectNumber,
      @EndUserText.label: 'Distribution Rule Number'
  key t.lfdnr as DistributionRuleNumber,
      @EndUserText.label: 'Settlement Type'
      t.perbz as SettlementType,
      @EndUserText.label: 'Receiver Category'
      t.konty as ReceiverCategory,
      @EndUserText.label: 'Settlement Percentage'
      t.prozs as SettlementPercentage,
      @EndUserText.label: 'Settlement Amount'
      t.betrr as SettlementAmount,
      @EndUserText.label: 'Currency'
      t.bwaer as Currency,
      @EndUserText.label: 'Controlling Area'
      t.kokrs as ControllingArea,
      @EndUserText.label: 'Company Code'
      t.bukrs as CompanyCode,
      @EndUserText.label: 'Receiver Cost Center'
      t.kostl as ReceiverCostCenter,
      @EndUserText.label: 'Receiver Order'
      t.aufnr as ReceiverOrder,
      @EndUserText.label: 'Receiver Asset'
      t.anln1 as ReceiverAsset,
      @EndUserText.label: 'Receiver Asset Subnumber'
      t.anln2 as ReceiverAssetSubnumber,
      @EndUserText.label: 'Receiver W B S Internal I D'
      t.pspnr as ReceiverWBSInternalID,
      @EndUserText.label: 'Valid From Year'
      t.gabja as ValidFromYear,
      @EndUserText.label: 'Valid From Period'
      t.gabpe as ValidFromPeriod,
      @EndUserText.label: 'Valid To Year'
      t.gbisj as ValidToYear,
      @EndUserText.label: 'Valid To Period'
      t.gbisp as ValidToPeriod
}
