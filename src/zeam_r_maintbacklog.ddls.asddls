// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Backlog cube over the operations of open maintenance orders: planned and remaining work,
//   number of open orders (distinct), order age in days and an age bucket, by work center, plant,
//   order type and priority.
// Example: Backlog in weeks per work center (remaining hours / weekly capacity); orders older than 90 days.
// Remaining work = planned work when nothing is confirmed, planned - actual when both use the same unit,
// otherwise 0 (mixed units are not converted).
// TODO-VERIFY[M] RPT-B01: @Aggregation.default: #COUNT_DISTINCT with @Aggregation.referenceElement in a #CUBE view entity
// TODO-VERIFY[M] RPT-B02: path expression _MaintenanceOrder.MaintOrderIsOpen in the WHERE clause of a view entity
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Maintenance Backlog - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEAM_R_MaintBacklog
  as select from ZEAM_I_MaintOrderOperation
{
      @ObjectModel.foreignKey.association: '_MaintenanceOrder'
  key MaintenanceOrder,
  key MaintenanceOrderOperation,
  key MaintenanceOrderSubOperation,
      WorkCenter,
      WorkCenterInternalID,
      Plant,
      OperationControlKey,
      PlannedWorkQuantityUnit,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      PlannedWorkQuantity,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Remaining Work'
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      cast( case when ActualWorkQuantity = 0
                 then cast( PlannedWorkQuantity as abap.dec( 13, 3 ) )
                 when ActualWorkQuantityUnit = PlannedWorkQuantityUnit and PlannedWorkQuantity > ActualWorkQuantity
                 then cast( PlannedWorkQuantity as abap.dec( 13, 3 ) ) - cast( ActualWorkQuantity as abap.dec( 13, 3 ) )
                 else cast( 0 as abap.dec( 13, 3 ) ) end as abap.quan( 13, 3 ) ) as RemainingWorkQuantity,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Open Operations'
      cast( 1 as abap.int4 ) as NumberOfOpenOperations,
      @Aggregation.default: #COUNT_DISTINCT
      @Aggregation.referenceElement: [ 'MaintenanceOrder' ]
      @EndUserText.label: 'Number of Open Orders'
      cast( 1 as abap.int4 ) as NumberOfOpenOrders,
      @Aggregation.default: #MAX
      @EndUserText.label: 'Order Age (Days)'
      dats_days_between( _MaintenanceOrder.CreationDate, $session.system_date ) as OrderAgeInDays,

      /* Order header characteristics */
      @EndUserText.label: 'Order Age Bucket'
      cast( case when dats_days_between( _MaintenanceOrder.CreationDate, $session.system_date ) <= 30 then '1: 0-30'
                 when dats_days_between( _MaintenanceOrder.CreationDate, $session.system_date ) <= 90 then '2: 31-90'
                 when dats_days_between( _MaintenanceOrder.CreationDate, $session.system_date ) <= 180 then '3: 91-180'
                 else '4: >180' end as abap.char( 10 ) ) as OrderAgeBucket,
      _MaintenanceOrder.MaintenanceOrderType,
      _MaintenanceOrder.MaintenanceActivityType,
      _MaintenanceOrder.MaintPriority,
      _MaintenanceOrder.MaintenancePlanningPlant,
      _MaintenanceOrder.MaintenancePlannerGroup,
      _MaintenanceOrder.MaintenancePlant,
      _MaintenanceOrder.CreationDate as MaintOrderCreationDate,
      _MaintenanceOrder.CompanyCode,
      _MaintenanceOrder.BusinessArea,
      _MaintenanceOrder.CostCenter,

      /* Associations */
      _MaintenanceOrder
}
where
  _MaintenanceOrder.MaintOrderIsOpen = 'X'
