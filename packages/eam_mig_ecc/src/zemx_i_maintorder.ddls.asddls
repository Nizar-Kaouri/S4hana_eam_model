// ModuPorter EAM migration | Release 1.0.0
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
{
      @EndUserText.label: 'Maintenance Order'
  key ord.MaintenanceOrder           as MaintenanceOrder,
      @EndUserText.label: 'Maintenance Order Type'
      ord.MaintenanceOrderType       as MaintenanceOrderType,
      @EndUserText.label: 'Maintenance Order Desc'
      ord.MaintenanceOrderDesc       as MaintenanceOrderDesc,
      @EndUserText.label: 'Maintenance Activity Type'
      pm.MaintenanceActivityType     as MaintenanceActivityType,
      @EndUserText.label: 'Maint Priority'
      pm.MaintPriority               as MaintPriority,
      @EndUserText.label: 'Maint Ord Basic Start Date'
      plan.MaintOrdBasicStartDate    as MaintOrdBasicStartDate,
      @EndUserText.label: 'Maint Ord Basic End Date'
      plan.MaintOrdBasicEndDate      as MaintOrdBasicEndDate,
      @EndUserText.label: 'Maintenance Planning Plant'
      pm.MaintenancePlanningPlant    as MaintenancePlanningPlant,
      @EndUserText.label: 'Maintenance Planner Group'
      pm.MaintenancePlannerGroup     as MaintenancePlannerGroup,
      @EndUserText.label: 'Main Work Center'
      pm._MainWorkCenter.WorkCenter  as MainWorkCenter,
      @EndUserText.label: 'Main Work Center Plant'
      pm._MainWorkCenter.Plant       as MainWorkCenterPlant,
      @EndUserText.label: 'Maintenance Plant'
      pm._LocAcctAssignment.MaintenancePlant as MaintenancePlant,
      @EndUserText.label: 'Company Code'
      ord.CompanyCode                as CompanyCode,
      @EndUserText.label: 'Business Area'
      ord.BusinessArea               as BusinessArea,
      @EndUserText.label: 'Controlling Area'
      ord.ControllingArea            as ControllingArea,
      @EndUserText.label: 'Responsible Cost Center'
      ord.ResponsibleCostCenter      as ResponsibleCostCenter,
      @EndUserText.label: 'Cost Center'
      pm._LocAcctAssignment.CostCenter as CostCenter,
      @EndUserText.label: 'Maintenance Notification'
      pm.MaintenanceNotification     as MaintenanceNotification,
      @EndUserText.label: 'Equipment'
      pm.Equipment                   as Equipment,
      @EndUserText.label: 'Functional Location'
      pm._LocAcctAssignment.FunctionalLocation as FunctionalLocation,
      @EndUserText.label: 'Maintenance Plan'
      pm.MaintenancePlan             as MaintenancePlan,
      @EndUserText.label: 'Maintenance Item'
      pm.MaintenanceItem             as MaintenanceItem,
      @EndUserText.label: 'Maint Object System Condition'
      pm.MaintObjectSystemCondition  as MaintObjectSystemCondition,
      @EndUserText.label: 'Order Routing Number'
      plan.OrderRoutingNumber        as OrderRoutingNumber,
      @EndUserText.label: 'Task List Type'
      plan.TaskListType              as TaskListType,
      @EndUserText.label: 'Task List Group'
      plan.TaskListGroup             as TaskListGroup,
      @EndUserText.label: 'Task List Group Counter'
      plan.TaskListGroupCounter      as TaskListGroupCounter,
      @EndUserText.label: 'Currency'
      ord.Currency                   as Currency,
      @EndUserText.label: 'Object Number'
      ord.ObjectNumber               as ObjectNumber,
      @EndUserText.label: 'Is Technically Completed'
      case ord._TechCompletedFlag.StatusCode when 'I0045' then 'X' else '' end as IsTechnicallyCompleted,
      @EndUserText.label: 'Is Closed'
      case ord._ClosedFlag.StatusCode when 'I0046' then 'X' else '' end as IsClosed,
      @EndUserText.label: 'Is Marked For Deletion'
      case ord._DeletionFlag.StatusCode when 'I0076' then 'X' else '' end as IsMarkedForDeletion,
      @EndUserText.label: 'Creation Date'
      ord.CreationDate               as CreationDate,
      @EndUserText.label: 'Created By User'
      ord.CreatedByUser              as CreatedByUser,
      @EndUserText.label: 'Last Change Date'
      ord.LastChangeDate             as LastChangeDate
}
