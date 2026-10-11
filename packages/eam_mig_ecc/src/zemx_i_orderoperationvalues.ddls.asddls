// ModuPorter EAM migration | Release 1.0.0
// Purpose: Quantities and durations of order operations (AFVV).
// Example: Read the planned work of routing number 1000001.
@AbapCatalog.sqlViewName: 'ZEMX_AFVV'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Order operation quantities'
@ObjectModel.representativeKey: 'OrderOperationInternalID'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_OrderOperationValues
  as select from afvv
{
      @EndUserText.label: 'Order Routing Number'
  key afvv.aufpl as OrderRoutingNumber,
      @EndUserText.label: 'Order Operation Internal ID'
  key afvv.aplzl as OrderOperationInternalID,
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      @EndUserText.label: 'Planned Work Quantity'
      afvv.arbei as PlannedWorkQuantity,
      @Semantics.unitOfMeasure: true
      @EndUserText.label: 'Planned Work Quantity Unit'
      afvv.arbeh as PlannedWorkQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'OperationDurationUnit'
      @EndUserText.label: 'Operation Duration'
      afvv.dauno as OperationDuration,
      @Semantics.unitOfMeasure: true
      @EndUserText.label: 'Operation Duration Unit'
      afvv.daune as OperationDurationUnit
}
