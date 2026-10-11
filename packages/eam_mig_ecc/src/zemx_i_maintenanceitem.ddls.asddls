// ModuPorter EAM migration | Release 1.0.0
// Purpose: Maintenance item with reference object, planning data, main work center (business key), order / notification type, task list and business area.
// Example: Read the items of the plans of plant 1000.
@AbapCatalog.sqlViewName: 'ZEMX_PLI'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Maintenance item'
@ObjectModel.representativeKey: 'MaintenanceItem'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_MaintenanceItem
  as select from ZEMX_I_MaintenanceItemHeader as itm
{
      @EndUserText.label: 'Maintenance Item'
  key itm.MaintenanceItem            as MaintenanceItem,
      @EndUserText.label: 'Maintenance Plan'
      itm.MaintenancePlan            as MaintenancePlan,
      @EndUserText.label: 'Maintenance Item Description'
      itm.MaintenanceItemDescription as MaintenanceItemDescription,
      @EndUserText.label: 'Equipment'
      itm.Equipment                  as Equipment,
      @EndUserText.label: 'Functional Location'
      itm.FunctionalLocation         as FunctionalLocation,
      @EndUserText.label: 'Maintenance Planning Plant'
      itm.MaintenancePlanningPlant   as MaintenancePlanningPlant,
      @EndUserText.label: 'Maintenance Planner Group'
      itm.MaintenancePlannerGroup    as MaintenancePlannerGroup,
      @EndUserText.label: 'Main Work Center'
      itm._MainWorkCenter.WorkCenter as MainWorkCenter,
      @EndUserText.label: 'Main Work Center Plant'
      itm._MainWorkCenter.Plant      as MainWorkCenterPlant,
      @EndUserText.label: 'Maintenance Order Type'
      itm.MaintenanceOrderType       as MaintenanceOrderType,
      @EndUserText.label: 'Notification Type'
      itm.NotificationType           as NotificationType,
      @EndUserText.label: 'Maintenance Activity Type'
      itm.MaintenanceActivityType    as MaintenanceActivityType,
      @EndUserText.label: 'Maint Priority'
      itm.MaintPriority              as MaintPriority,
      @EndUserText.label: 'Task List Type'
      itm.TaskListType               as TaskListType,
      @EndUserText.label: 'Task List Group'
      itm.TaskListGroup              as TaskListGroup,
      @EndUserText.label: 'Task List Group Counter'
      itm.TaskListGroupCounter       as TaskListGroupCounter,
      @EndUserText.label: 'Business Area'
      itm._LocAcctAssignment.BusinessArea as BusinessArea,
      @EndUserText.label: 'Main Work Center Internal ID'
      itm.MainWorkCenterInternalID   as MainWorkCenterInternalID,
      @EndUserText.label: 'Loc Acct Assignment'
      itm.LocAcctAssignment          as LocAcctAssignment,
      @EndUserText.label: 'Creation Date'
      itm.CreationDate               as CreationDate,
      @EndUserText.label: 'Last Change Date'
      itm.LastChangeDate             as LastChangeDate
}
