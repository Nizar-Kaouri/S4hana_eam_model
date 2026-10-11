// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Maintenance item cube with plan characteristics (category, strategy, inactive flag) via
//   path expressions and counters for items and items with a task list.
// Example: Preventive maintenance coverage per planning plant; items without task list.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Maintenance Item - Cube'
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
define view entity ZEAM_I_MaintItem
  as select from ZEAM_B_MaintItem
  association [1..1] to ZEAM_B_MaintItem as _MaintenanceItem on $projection.MaintenanceItem = _MaintenanceItem.MaintenanceItem
{
      @ObjectModel.foreignKey.association: '_MaintenanceItem'
  key MaintenanceItem,
      @ObjectModel.foreignKey.association: '_MaintenancePlan'
      MaintenancePlan,
      MaintenancePlanCategory,
      Equipment,
      FunctionalLocation,
      @ObjectModel.foreignKey.association: '_MaintenancePlanningPlant'
      MaintenancePlanningPlant,
      MaintenancePlannerGroup,
      MainWorkCenter,
      BusinessArea,
      MaintenanceOrderType,
      MaintPriority,
      MaintenanceActivityType,
      TaskListType,
      TaskListGroup,
      TaskListGroupCounter,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Maintenance Items'
      cast( 1 as abap.int4 ) as NumberOfMaintItems,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Items with Task List'
      cast( case when TaskListGroup <> '' then 1 else 0 end as abap.int4 ) as NumberOfItemsWithTaskList,

      /* Plan characteristics */
      _MaintenancePlan.MaintenanceStrategy,
      _MaintenancePlan.MaintenancePlanIsInactive,

      /* Associations */
      _MaintenancePlan,
      _MaintenancePlanningPlant,
      _MaintenanceItem
}
