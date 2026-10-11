// ZPPV PP VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Schedule adherence cube over open production orders: number of open and late orders, maximum days
//   late, delay bucket and open quantity per plant, MRP controller and material.
// Example: Late orders per MRP controller; delay buckets per plant.
// OpenQuantity is the planned quantity of orders not fully delivered (delivered quantity is not deducted yet).
// TODO-VERIFY[M] PP-R01: open quantity rule (planned vs. delivered) and late rule (planned end before today) - confirm with production controlling
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Production Order Schedule Adherence'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZPPV_I_OrderSchedule
  as select from ZPPV_B_ProductionOrder
  association [1..1] to ZPPV_B_ProductionOrder as _ProductionOrder on $projection.ManufacturingOrder = _ProductionOrder.ManufacturingOrder
{
      @ObjectModel.foreignKey.association: '_ProductionOrder'
  key ManufacturingOrder,
      ManufacturingOrderType,
      Material,
      ProductionPlant,
      MRPController,
      ProductionSupervisor,
      ProductionUnit,
      MfgOrderPlannedEndDate,
      @EndUserText.label: 'Order Is Late'
      cast( case when MfgOrderPlannedEndDate < $session.system_date then 'X' else ' ' end as abap_boolean ) as ProductionOrderIsLate,
      @EndUserText.label: 'Delay Bucket (days after planned end)'
      cast( case when dats_days_between( MfgOrderPlannedEndDate, $session.system_date ) <= 30 then '1: 0-30'
                 when dats_days_between( MfgOrderPlannedEndDate, $session.system_date ) <= 90 then '2: 31-90'
                 when dats_days_between( MfgOrderPlannedEndDate, $session.system_date ) <= 180 then '3: 91-180'
                 else '4: >180' end as abap.char( 10 ) ) as DelayBucket,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Open Orders'
      cast( 1 as abap.int4 ) as NumberOfOpenOrders,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Late Orders'
      cast( case when MfgOrderPlannedEndDate < $session.system_date then 1 else 0 end as abap.int4 ) as NumberOfLateOrders,
      @Aggregation.default: #MAX
      @EndUserText.label: 'Days Late (max)'
      case when MfgOrderPlannedEndDate < $session.system_date
            then dats_days_between( MfgOrderPlannedEndDate, $session.system_date ) else 0 end as DaysLate,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Open Quantity'
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      cast( case when MfgOrderPlannedTotalQty > ActualDeliveredQuantity then cast( MfgOrderPlannedTotalQty as abap.dec( 13, 3 ) ) else 0 end
            as abap.quan( 13, 3 ) ) as OpenQuantity,

      /* Associations */
      _ProductionOrder
}
where
  ProductionOrderIsOpen = 'X'
