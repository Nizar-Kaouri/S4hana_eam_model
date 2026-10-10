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
    inner join ZEMX_I_MaintenancePlan as obj on obj.MaintenancePlan = src.MaintenancePlan
{
  key src.MaintenanceItem            as MaintenanceItem,
      src.MaintenancePlan            as MaintenancePlan,
      src.MaintenanceItemDescription as MaintenanceItemDescription,
      src.Equipment                  as Equipment,
      src.FunctionalLocation         as FunctionalLocation,
      src.MaintenancePlanningPlant   as MaintenancePlanningPlant,
      src.MaintenancePlannerGroup    as MaintenancePlannerGroup,
      src.MainWorkCenter             as MainWorkCenter,
      src.MainWorkCenterPlant        as MainWorkCenterPlant,
      src.MaintenanceOrderType       as MaintenanceOrderType,
      src.NotificationType           as NotificationType,
      src.MaintenanceActivityType    as MaintenanceActivityType,
      src.MaintPriority              as MaintPriority,
      src.TaskListType               as TaskListType,
      src.TaskListGroup              as TaskListGroup,
      src.TaskListGroupCounter       as TaskListGroupCounter,
      src.BusinessArea               as BusinessArea,
      src.LastChangeDate             as LastChangeDate
}
where obj.IsMarkedForDeletion = ''
