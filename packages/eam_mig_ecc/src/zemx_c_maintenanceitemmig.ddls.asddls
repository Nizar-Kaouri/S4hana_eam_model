// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Maintenance items of the plans in scope with reference objects, work center, types and task list.
// Example: The load program adds the items to the plan created from ZEMX_C_MaintenancePlanMig.
@AbapCatalog.sqlViewName: 'ZEMX_CPLI'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Maintenance item (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MaintenanceItemMig
  as select from ZEMX_I_MaintenanceItem as src
  association [0..1] to ZEMX_I_MaintenancePlan as _MaintenancePlan on _MaintenancePlan.MaintenancePlan = $projection.MaintenancePlan
{
      @EndUserText.label: 'Maintenance Item'
  key src.MaintenanceItem            as MaintenanceItem,
      @EndUserText.label: 'Maintenance Plan'
      src.MaintenancePlan            as MaintenancePlan,
      @EndUserText.label: 'Maintenance Item Description'
      src.MaintenanceItemDescription as MaintenanceItemDescription,
      @EndUserText.label: 'Equipment'
      src.Equipment                  as Equipment,
      @EndUserText.label: 'Functional Location'
      src.FunctionalLocation         as FunctionalLocation,
      @EndUserText.label: 'Maintenance Planning Plant'
      src.MaintenancePlanningPlant   as MaintenancePlanningPlant,
      @EndUserText.label: 'Maintenance Planner Group'
      src.MaintenancePlannerGroup    as MaintenancePlannerGroup,
      @EndUserText.label: 'Main Work Center'
      src.MainWorkCenter             as MainWorkCenter,
      @EndUserText.label: 'Main Work Center Plant'
      src.MainWorkCenterPlant        as MainWorkCenterPlant,
      @EndUserText.label: 'Maintenance Order Type'
      src.MaintenanceOrderType       as MaintenanceOrderType,
      @EndUserText.label: 'Notification Type'
      src.NotificationType           as NotificationType,
      @EndUserText.label: 'Maintenance Activity Type'
      src.MaintenanceActivityType    as MaintenanceActivityType,
      @EndUserText.label: 'Maint Priority'
      src.MaintPriority              as MaintPriority,
      @EndUserText.label: 'Task List Type'
      src.TaskListType               as TaskListType,
      @EndUserText.label: 'Task List Group'
      src.TaskListGroup              as TaskListGroup,
      @EndUserText.label: 'Task List Group Counter'
      src.TaskListGroupCounter       as TaskListGroupCounter,
      @EndUserText.label: 'Business Area'
      src.BusinessArea               as BusinessArea,
      @EndUserText.label: 'Last Change Date'
      src.LastChangeDate             as LastChangeDate
}
where _MaintenancePlan.IsMarkedForDeletion = ''
