// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
  key afvv.aufpl as OrderRoutingNumber,
  key afvv.aplzl as OrderOperationInternalID,
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      afvv.arbei as PlannedWorkQuantity,
      @Semantics.unitOfMeasure: true
      afvv.arbeh as PlannedWorkQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'OperationDurationUnit'
      afvv.dauno as OperationDuration,
      @Semantics.unitOfMeasure: true
      afvv.daune as OperationDurationUnit
}
