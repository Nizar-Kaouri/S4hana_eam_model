// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per maintenance item with its plan, reference object (plain fields), planning data,
//   order type / priority / activity type to be generated and the assigned task list.
// Example: Which equipment is covered by preventive maintenance, and with which task list.
// TODO-VERIFY[M] PL-010: I_MaintenanceItem exists, is released (C1) and its key element is MaintenanceItem
// TODO-VERIFY[M] PL-011: elements MaintenanceItemDescription, MaintenancePlan, MaintenancePlanCategory
// TODO-VERIFY[M] PL-012: reference and planning elements Equipment, FunctionalLocation, MaintenancePlanningPlant, MaintenancePlannerGroup, MainWorkCenter, BusinessArea
// TODO-VERIFY[M] PL-013: order generation elements MaintenanceOrderType, MaintPriority, MaintenanceActivityType
// TODO-VERIFY[M] PL-014: task list reference elements TaskListType, TaskListGroup, TaskListGroupCounter
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Maintenance Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MaintenanceItem'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEAM_I_MaintItem
  as select from I_MaintenanceItem
  association [0..1] to ZEAM_I_MaintPlan as _MaintenancePlan          on $projection.MaintenancePlan = _MaintenancePlan.MaintenancePlan
  association [0..1] to I_Plant          as _MaintenancePlanningPlant on $projection.MaintenancePlanningPlant = _MaintenancePlanningPlant.Plant
{
      @ObjectModel.text.element: [ 'MaintenanceItemDescription' ]
  key MaintenanceItem,
      @Semantics.text: true
      MaintenanceItemDescription,
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

      /* Associations */
      _MaintenancePlan,
      _MaintenancePlanningPlant
}
