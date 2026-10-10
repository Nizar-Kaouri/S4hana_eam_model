// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Maintenance order with planning data, reference object, account assignment, main work center (business key) and the status flags that decide the migration scope.
// Example: Read the open orders: filter IsTechnicallyCompleted = '', IsClosed = '' and IsMarkedForDeletion = ''.
@AbapCatalog.sqlViewName: 'ZEMX_OR'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Maintenance order'
@ObjectModel.representativeKey: 'MaintenanceOrder'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_MaintOrder
  as select from ZEMX_I_OrderMasterData as ord
    inner join ZEMX_I_OrderMaintData as pm on pm.MaintenanceOrder = ord.MaintenanceOrder
    inner join ZEMX_I_OrderHeaderPlanning as plan on plan.MaintenanceOrder = ord.MaintenanceOrder
    left outer join ZEMX_I_LocAcctAssignment as loc on loc.LocAcctAssignment = pm.LocAcctAssignment
    left outer join ZEMX_I_WorkCenterHeader as wc on wc.WorkCenterInternalID = pm.MainWorkCenterInternalID
    left outer join ZEMX_I_StatusTechCompleted as teco on teco.ObjectNumber = ord.ObjectNumber
    left outer join ZEMX_I_StatusClosed as clsd on clsd.ObjectNumber = ord.ObjectNumber
    left outer join ZEMX_I_StatusDeletionFlag as dlfl on dlfl.ObjectNumber = ord.ObjectNumber
{
  key ord.MaintenanceOrder           as MaintenanceOrder,
      ord.MaintenanceOrderType       as MaintenanceOrderType,
      ord.MaintenanceOrderDesc       as MaintenanceOrderDesc,
      pm.MaintenanceActivityType     as MaintenanceActivityType,
      pm.MaintPriority               as MaintPriority,
      plan.MaintOrdBasicStartDate    as MaintOrdBasicStartDate,
      plan.MaintOrdBasicEndDate      as MaintOrdBasicEndDate,
      pm.MaintenancePlanningPlant    as MaintenancePlanningPlant,
      pm.MaintenancePlannerGroup     as MaintenancePlannerGroup,
      wc.WorkCenter                  as MainWorkCenter,
      wc.Plant                       as MainWorkCenterPlant,
      loc.MaintenancePlant           as MaintenancePlant,
      ord.CompanyCode                as CompanyCode,
      ord.BusinessArea               as BusinessArea,
      ord.ControllingArea            as ControllingArea,
      ord.ResponsibleCostCenter      as ResponsibleCostCenter,
      loc.CostCenter                 as CostCenter,
      pm.MaintenanceNotification     as MaintenanceNotification,
      pm.Equipment                   as Equipment,
      loc.FunctionalLocation         as FunctionalLocation,
      pm.MaintenancePlan             as MaintenancePlan,
      pm.MaintenanceItem             as MaintenanceItem,
      pm.MaintObjectSystemCondition  as MaintObjectSystemCondition,
      plan.OrderRoutingNumber        as OrderRoutingNumber,
      plan.TaskListType              as TaskListType,
      plan.TaskListGroup             as TaskListGroup,
      plan.TaskListGroupCounter      as TaskListGroupCounter,
      ord.Currency                   as Currency,
      ord.ObjectNumber               as ObjectNumber,
      case teco.StatusCode when 'I0045' then 'X' else '' end as IsTechnicallyCompleted,
      case clsd.StatusCode when 'I0046' then 'X' else '' end as IsClosed,
      case dlfl.StatusCode when 'I0076' then 'X' else '' end as IsMarkedForDeletion,
      ord.CreationDate               as CreationDate,
      ord.CreatedByUser              as CreatedByUser,
      ord.LastChangeDate             as LastChangeDate
}
