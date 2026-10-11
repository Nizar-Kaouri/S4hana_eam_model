// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Maintenance item with an association to the task list (all change versions) it uses.
// Example: Show task list description and status next to each maintenance item.
// LINK VIEW (ships only when modules "maintenance_plan" AND "task_list" are selected).
// The association is to-many because the task list view returns all change versions (TL-004).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Maintenance Item with Task List'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MaintenanceItem'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZEAM_B_MaintItemWithTaskList
  as select from ZEAM_B_MaintItem
  association [0..*] to ZEAM_B_TaskList as _TaskList on $projection.TaskListType = _TaskList.TaskListType and $projection.TaskListGroup = _TaskList.TaskListGroup and $projection.TaskListGroupCounter = _TaskList.TaskListGroupCounter
{
  key MaintenanceItem,
      MaintenancePlan,
      TaskListType,
      TaskListGroup,
      TaskListGroupCounter,
      Equipment,
      FunctionalLocation,
      MaintenancePlanningPlant,
      MaintenancePlannerGroup,
      BusinessArea,

      /* Associations */
      _TaskList
}
