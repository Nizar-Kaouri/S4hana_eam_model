// ZPPV PP VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Production order cube: number of (open) orders and planned, confirmed, scrap and delivered quantity
//   per plant, material, MRP controller and month.
// Example: Yield vs. plan per material and month; open orders per MRP controller.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Production Order - Cube'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZPPV_R_ProductionOrder
  as select from ZPPV_I_ProductionOrder
  association [1..1] to ZPPV_I_ProductionOrder as _ProductionOrder on $projection.ManufacturingOrder = _ProductionOrder.ManufacturingOrder
{
      @ObjectModel.foreignKey.association: '_ProductionOrder'
  key ManufacturingOrder,
      ManufacturingOrderType,
      Material,
      @ObjectModel.foreignKey.association: '_ProductionPlant'
      ProductionPlant,
      MRPController,
      ProductionSupervisor,
      ProductionUnit,
      ProductionOrderIsOpen,
      MfgOrderPlannedStartDate,
      MfgOrderPlannedEndDate,
      CompanyCode,
      @EndUserText.label: 'Planned End Year/Month'
      cast( substring( MfgOrderPlannedEndDate, 1, 6 ) as abap.numc( 6 ) ) as PlannedEndYearMonth,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Orders'
      cast( 1 as abap.int4 ) as NumberOfProductionOrders,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Open Orders'
      cast( case when ProductionOrderIsOpen = 'X' then 1 else 0 end as abap.int4 ) as NumberOfOpenOrders,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Planned Quantity'
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      MfgOrderPlannedTotalQty,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Confirmed Yield'
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      MfgOrderConfirmedYieldQty,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Planned Scrap'
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      MfgOrderPlannedScrapQty,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Delivered Quantity'
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      ActualDeliveredQuantity,

      /* Associations */
      _ProductionPlant,
      _ProductionOrder
}
