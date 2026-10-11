// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Order header cube with counters for all and open orders and the planned order duration.
// Example: Open orders per planning plant and order type; share of breakdown (activity type) orders.
// TODO-VERIFY[L] MO-R01: dats_days_between on basic start/end dates as a summable measure
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Maintenance Order - Cube'
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
define view entity ZEAM_I_MaintOrder
  as select from ZEAM_B_MaintOrder
  association [1..1] to ZEAM_B_MaintOrder as _MaintenanceOrder on $projection.MaintenanceOrder = _MaintenanceOrder.MaintenanceOrder
{
      @ObjectModel.foreignKey.association: '_MaintenanceOrder'
  key MaintenanceOrder,
      MaintenanceOrderType,
      MaintenanceActivityType,
      MaintPriority,
      MaintOrdProcessPhaseCode,
      MaintOrderIsOpen,
      MaintOrdBasicStartDate,
      MaintOrdBasicEndDate,
      CreationDate,
      TechnicalCompletionDate,
      @ObjectModel.foreignKey.association: '_MaintenancePlanningPlant'
      MaintenancePlanningPlant,
      MaintenancePlannerGroup,
      @ObjectModel.foreignKey.association: '_MaintenancePlant'
      MaintenancePlant,
      MainWorkCenter,
      MainWorkCenterPlant,
      @ObjectModel.foreignKey.association: '_CompanyCode'
      CompanyCode,
      BusinessArea,
      ControllingArea,
      CostCenter,
      MaintenanceNotification,
      Equipment,
      FunctionalLocation,
      MaintenancePlan,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Orders'
      cast( 1 as abap.int4 ) as NumberOfOrders,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Open Orders'
      cast( case when MaintOrderIsOpen = 'X' then 1 else 0 end as abap.int4 ) as NumberOfOpenOrders,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Planned Duration (Days)'
      cast( case when MaintOrdBasicStartDate <> '00000000' and MaintOrdBasicEndDate <> '00000000'
                 then dats_days_between( MaintOrdBasicStartDate, MaintOrdBasicEndDate ) else 0 end as abap.int4 ) as PlannedDurationInDays,

      /* Associations */
      _MaintenancePlant,
      _MaintenancePlanningPlant,
      _CompanyCode,
      _MaintenanceOrder
}
