// ZPPV PP VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Operation cube: planned, confirmed yield and scrap quantity per work center, with order type,
//   material and plant from the order header.
// Example: Scrap rate per work center and material.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Production Order Operation - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #XL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZPPV_I_ProductionOrderOp
  as select from ZPPV_B_ProductionOrderOp
{
      @ObjectModel.foreignKey.association: '_ProductionOrder'
  key ManufacturingOrder,
  key ManufacturingOrderSequence,
  key ManufacturingOrderOperation,
      WorkCenterInternalID,
      OperationControlProfile,
      OperationUnit,
      OpErlstSchedldExecEndDte,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Operations'
      cast( 1 as abap.int4 ) as NumberOfOperations,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Planned Quantity'
      @Semantics.quantity.unitOfMeasure: 'OperationUnit'
      OpPlannedTotalQuantity,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Confirmed Yield'
      @Semantics.quantity.unitOfMeasure: 'OperationUnit'
      OpTotalConfirmedYieldQty,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Confirmed Scrap'
      @Semantics.quantity.unitOfMeasure: 'OperationUnit'
      OpTotalConfirmedScrapQty,

      /* Order header characteristics */
      _ProductionOrder.ManufacturingOrderType,
      _ProductionOrder.Material,
      _ProductionOrder.ProductionPlant,
      _ProductionOrder.MRPController,
      _ProductionOrder.ProductionOrderIsOpen,

      /* Associations */
      _ProductionOrder
}
