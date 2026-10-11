// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per task list operation version with work center, control key and planned work.
// Example: Planned work content of task lists per work center (capacity planning for preventive maintenance).
// TODO-VERIFY[H] TL-010: SAP released view for task list operations is I_MaintenanceTaskListOperation (name not confirmed)
// TODO-VERIFY[H] TL-011: key elements TaskListType, TaskListGroup, TaskListGroupCounter, TaskListOperationInternalId, TaskListOpVersionCounter
// TODO-VERIFY[H] TL-012: elements OperationText, WorkCenterInternalID, Plant, OperationControlKey, PlannedWorkQuantity, PlannedWorkQuantityUnit
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Maintenance Task List Operation'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'TaskListOpVersionCounter'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEAM_B_TaskListOperation
  as select from I_MaintenanceTaskListOperation
  association [0..*] to ZEAM_B_TaskList as _TaskList on  $projection.TaskListType         = _TaskList.TaskListType
                                                    and $projection.TaskListGroup        = _TaskList.TaskListGroup
                                                    and $projection.TaskListGroupCounter = _TaskList.TaskListGroupCounter
{
  key TaskListType,
  key TaskListGroup,
  key TaskListGroupCounter,
  key TaskListOperationInternalId,
  key TaskListOpVersionCounter,
      @Semantics.text: true
      OperationText,
      OperationControlKey,
      WorkCenterInternalID,
      Plant,
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      PlannedWorkQuantity,
      PlannedWorkQuantityUnit,

      /* Associations */
      _TaskList
}
