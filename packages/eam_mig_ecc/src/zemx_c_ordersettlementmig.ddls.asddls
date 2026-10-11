// ModuPorter EAM migration | Release 1.0.0
// Purpose: OrderSettlement migration extract
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N7C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'OrderSettlement migration extract'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_OrderSettlementMig
  as select from ZEMX_I_OrderSettlement as src
  association [0..1] to ZEMX_I_MaintOrder as _Parent on _Parent.ObjectNumber = $projection.ObjectNumber
{
      @EndUserText.label: 'Object Number'
  key src.ObjectNumber as ObjectNumber,
      @EndUserText.label: 'Distribution Rule Number'
  key src.DistributionRuleNumber as DistributionRuleNumber,
  key src.DistributionRuleGroup as DistributionRuleGroup,
      @EndUserText.label: 'Settlement Type'
      src.SettlementType as SettlementType,
      @EndUserText.label: 'Receiver Category'
      src.ReceiverCategory as ReceiverCategory,
      @EndUserText.label: 'Settlement Percentage'
      src.SettlementPercentage as SettlementPercentage,
      @EndUserText.label: 'Settlement Amount'
      @Semantics.amount.currencyCode: 'Currency'
      src.SettlementAmount as SettlementAmount,
      @EndUserText.label: 'Currency'
      @Semantics.currencyCode: true
      src.Currency as Currency,
      @EndUserText.label: 'Controlling Area'
      src.ControllingArea as ControllingArea,
      @EndUserText.label: 'Company Code'
      src.CompanyCode as CompanyCode,
      @EndUserText.label: 'Receiver Cost Center'
      src.ReceiverCostCenter as ReceiverCostCenter,
      @EndUserText.label: 'Receiver Order'
      src.ReceiverOrder as ReceiverOrder,
      @EndUserText.label: 'Receiver Asset'
      src.ReceiverAsset as ReceiverAsset,
      @EndUserText.label: 'Receiver Asset Subnumber'
      src.ReceiverAssetSubnumber as ReceiverAssetSubnumber,
      @EndUserText.label: 'Receiver W B S Internal I D'
      src.ReceiverWBSInternalID as ReceiverWBSInternalID,
      @EndUserText.label: 'Valid From Year'
      src.ValidFromYear as ValidFromYear,
      @EndUserText.label: 'Valid From Period'
      src.ValidFromPeriod as ValidFromPeriod,
      @EndUserText.label: 'Valid To Year'
      src.ValidToYear as ValidToYear,
      @EndUserText.label: 'Valid To Period'
      src.ValidToPeriod as ValidToPeriod,
      @EndUserText.label: 'Maintenance Order'
      src.MaintenanceOrder as MaintenanceOrder
}
where _Parent.IsClosed = '' and _Parent.IsTechnicallyCompleted = '' and _Parent.IsMarkedForDeletion = ''
