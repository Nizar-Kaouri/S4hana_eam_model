// ZEMX EAM migration - status: draft-unverified (no SAP system; never activated)
// Purpose: OrderSettlement migration business data
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N7I'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'OrderSettlement migration business data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_OrderSettlement
  as select from ZEMX_I_OrderSettlementData as b
  association [0..1] to ZEMX_I_MaintOrder as _Order on _Order.ObjectNumber = $projection.ObjectNumber
{
      @EndUserText.label: 'Object Number'
  key b.ObjectNumber as ObjectNumber,
      @EndUserText.label: 'Distribution Rule Number'
  key b.DistributionRuleNumber as DistributionRuleNumber,
      @EndUserText.label: 'Settlement Type'
      b.SettlementType as SettlementType,
      @EndUserText.label: 'Receiver Category'
      b.ReceiverCategory as ReceiverCategory,
      @EndUserText.label: 'Settlement Percentage'
      b.SettlementPercentage as SettlementPercentage,
      @EndUserText.label: 'Settlement Amount'
      @Semantics.amount.currencyCode: 'Currency'
      b.SettlementAmount as SettlementAmount,
      @EndUserText.label: 'Currency'
      @Semantics.currencyCode: true
      b.Currency as Currency,
      @EndUserText.label: 'Controlling Area'
      b.ControllingArea as ControllingArea,
      @EndUserText.label: 'Company Code'
      b.CompanyCode as CompanyCode,
      @EndUserText.label: 'Receiver Cost Center'
      b.ReceiverCostCenter as ReceiverCostCenter,
      @EndUserText.label: 'Receiver Order'
      b.ReceiverOrder as ReceiverOrder,
      @EndUserText.label: 'Receiver Asset'
      b.ReceiverAsset as ReceiverAsset,
      @EndUserText.label: 'Receiver Asset Subnumber'
      b.ReceiverAssetSubnumber as ReceiverAssetSubnumber,
      @EndUserText.label: 'Receiver W B S Internal I D'
      b.ReceiverWBSInternalID as ReceiverWBSInternalID,
      @EndUserText.label: 'Valid From Year'
      b.ValidFromYear as ValidFromYear,
      @EndUserText.label: 'Valid From Period'
      b.ValidFromPeriod as ValidFromPeriod,
      @EndUserText.label: 'Valid To Year'
      b.ValidToYear as ValidToYear,
      @EndUserText.label: 'Valid To Period'
      b.ValidToPeriod as ValidToPeriod,
      @EndUserText.label: 'Maintenance Order'
      _Order.MaintenanceOrder as MaintenanceOrder
}
