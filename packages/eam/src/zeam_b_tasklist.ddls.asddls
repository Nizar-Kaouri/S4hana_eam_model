// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per maintenance task list header version (general / equipment / functional
//   location task list) with description, plant, usage, status and strategy.
// Example: Task lists per plant and strategy; task list as target of the maintenance item link view.
// All change versions are returned; a "current version only" filter is a later refinement (TL-004).
// TODO-VERIFY[H] TL-001: SAP released view for maintenance task list headers is I_MaintenanceTaskList (name not confirmed)
// TODO-VERIFY[H] TL-002: key elements TaskListType, TaskListGroup, TaskListGroupCounter, TaskListVersionCounter
// TODO-VERIFY[M] TL-003: elements TaskListDesc, Plant, TaskListUsage, TaskListStatus, MaintenanceStrategy, MaintenancePlannerGroup, ValidityStartDate, AuthorizationGroup
// TODO-VERIFY[M] TL-004: change versions (PLKO-ZAEHL) - consumers may need to restrict to the latest version valid today
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Maintenance Task List'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'TaskListVersionCounter'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEAM_B_TaskList
  as select from I_MaintenanceTaskList
  association [0..1] to I_Plant as _Plant on $projection.Plant = _Plant.Plant
{
  key TaskListType,
  key TaskListGroup,
  key TaskListGroupCounter,
  key TaskListVersionCounter,
      @Semantics.text: true
      TaskListDesc,
      @ObjectModel.foreignKey.association: '_Plant'
      Plant,
      TaskListUsage,
      TaskListStatus,
      MaintenanceStrategy,
      MaintenancePlannerGroup,
      ValidityStartDate,
      AuthorizationGroup,

      /* Associations */
      _Plant
}
