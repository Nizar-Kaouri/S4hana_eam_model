// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
    left outer join ZEMX_I_LocAcctAssignment as loc on loc.LocAcctAssignment = itm.LocAcctAssignment
    left outer join ZEMX_I_WorkCenterHeader as wc on wc.WorkCenterInternalID = itm.MainWorkCenterInternalID
{
  key itm.MaintenanceItem            as MaintenanceItem,
      itm.MaintenancePlan            as MaintenancePlan,
      itm.MaintenanceItemDescription as MaintenanceItemDescription,
      itm.Equipment                  as Equipment,
      itm.FunctionalLocation         as FunctionalLocation,
      itm.MaintenancePlanningPlant   as MaintenancePlanningPlant,
      itm.MaintenancePlannerGroup    as MaintenancePlannerGroup,
      wc.WorkCenter                  as MainWorkCenter,
      wc.Plant                       as MainWorkCenterPlant,
      itm.MaintenanceOrderType       as MaintenanceOrderType,
      itm.NotificationType           as NotificationType,
      itm.MaintenanceActivityType    as MaintenanceActivityType,
      itm.MaintPriority              as MaintPriority,
      itm.TaskListType               as TaskListType,
      itm.TaskListGroup              as TaskListGroup,
      itm.TaskListGroupCounter       as TaskListGroupCounter,
      loc.BusinessArea               as BusinessArea,
      itm.MainWorkCenterInternalID   as MainWorkCenterInternalID,
      itm.LocAcctAssignment          as LocAcctAssignment,
      itm.CreationDate               as CreationDate,
      itm.LastChangeDate             as LastChangeDate
}
