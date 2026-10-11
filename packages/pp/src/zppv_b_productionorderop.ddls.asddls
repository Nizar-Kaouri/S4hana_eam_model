// ZPPV PP VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per production order operation: text, work center, control profile, planned and confirmed
//   yield / scrap quantity and scheduled dates.
// Example: Confirmed scrap per work center; operations behind schedule.
// TODO-VERIFY[H] PP-010: SAP released view is I_ManufacturingOrderOperation with keys ManufacturingOrder, ManufacturingOrderSequence, ManufacturingOrderOperation
// TODO-VERIFY[H] PP-011: quantity elements OpPlannedTotalQuantity, OpTotalConfirmedYieldQty, OpTotalConfirmedScrapQty, OperationUnit
// TODO-VERIFY[M] PP-012: elements MfgOrderOperationText, WorkCenterInternalID, WorkCenterTypeCode, OperationControlProfile, OpErlstSchedldExecStrtDte, OpErlstSchedldExecEndDte
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Production Order Operation'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'ManufacturingOrderOperation'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #XL,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZPPV_B_ProductionOrderOp
  as select from I_ManufacturingOrderOperation
  association [1..1] to ZPPV_B_ProductionOrder as _ProductionOrder on $projection.ManufacturingOrder = _ProductionOrder.ManufacturingOrder
{
      @ObjectModel.foreignKey.association: '_ProductionOrder'
  key ManufacturingOrder,
  key ManufacturingOrderSequence,
  key ManufacturingOrderOperation,
      MfgOrderOperationText,
      WorkCenterInternalID,
      WorkCenterTypeCode,
      OperationControlProfile,
      OperationUnit,
      @Semantics.quantity.unitOfMeasure: 'OperationUnit'
      OpPlannedTotalQuantity,
      @Semantics.quantity.unitOfMeasure: 'OperationUnit'
      OpTotalConfirmedYieldQty,
      @Semantics.quantity.unitOfMeasure: 'OperationUnit'
      OpTotalConfirmedScrapQty,
      OpErlstSchedldExecStrtDte,
      OpErlstSchedldExecEndDte,

      /* Associations */
      _ProductionOrder
}
