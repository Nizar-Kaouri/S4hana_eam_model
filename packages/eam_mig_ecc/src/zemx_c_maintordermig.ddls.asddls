// ModuPorter EAM migration | Release 1.0.0
// Purpose: Open maintenance orders (not technically completed, not closed, not deleted).
// Example: The load program creates one order per row.
@AbapCatalog.sqlViewName: 'ZEMX_COR'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Maintenance order (migration)'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MaintOrderMig
  as select from ZEMX_I_MaintOrder as src
{
      @EndUserText.label: 'Maintenance Order'
  key src.MaintenanceOrder           as MaintenanceOrder,
      @EndUserText.label: 'Maintenance Order Type'
      src.MaintenanceOrderType       as MaintenanceOrderType,
      @EndUserText.label: 'Maintenance Order Desc'
      src.MaintenanceOrderDesc       as MaintenanceOrderDesc,
      @EndUserText.label: 'Maintenance Activity Type'
      src.MaintenanceActivityType    as MaintenanceActivityType,
      @EndUserText.label: 'Maint Priority'
      src.MaintPriority              as MaintPriority,
      @EndUserText.label: 'Maint Ord Basic Start Date'
      src.MaintOrdBasicStartDate     as MaintOrdBasicStartDate,
      @EndUserText.label: 'Maint Ord Basic End Date'
      src.MaintOrdBasicEndDate       as MaintOrdBasicEndDate,
      @EndUserText.label: 'Maintenance Planning Plant'
      src.MaintenancePlanningPlant   as MaintenancePlanningPlant,
      @EndUserText.label: 'Maintenance Planner Group'
      src.MaintenancePlannerGroup    as MaintenancePlannerGroup,
      @EndUserText.label: 'Main Work Center'
      src.MainWorkCenter             as MainWorkCenter,
      @EndUserText.label: 'Main Work Center Plant'
      src.MainWorkCenterPlant        as MainWorkCenterPlant,
      @EndUserText.label: 'Maintenance Plant'
      src.MaintenancePlant           as MaintenancePlant,
      @EndUserText.label: 'Company Code'
      src.CompanyCode                as CompanyCode,
      @EndUserText.label: 'Business Area'
      src.BusinessArea               as BusinessArea,
      @EndUserText.label: 'Controlling Area'
      src.ControllingArea            as ControllingArea,
      @EndUserText.label: 'Responsible Cost Center'
      src.ResponsibleCostCenter      as ResponsibleCostCenter,
      @EndUserText.label: 'Cost Center'
      src.CostCenter                 as CostCenter,
      @EndUserText.label: 'Maintenance Notification'
      src.MaintenanceNotification    as MaintenanceNotification,
      @EndUserText.label: 'Equipment'
      src.Equipment                  as Equipment,
      @EndUserText.label: 'Functional Location'
      src.FunctionalLocation         as FunctionalLocation,
      @EndUserText.label: 'Maintenance Plan'
      src.MaintenancePlan            as MaintenancePlan,
      @EndUserText.label: 'Maintenance Item'
      src.MaintenanceItem            as MaintenanceItem,
      @EndUserText.label: 'Maint Object System Condition'
      src.MaintObjectSystemCondition as MaintObjectSystemCondition,
      @EndUserText.label: 'Task List Type'
      src.TaskListType               as TaskListType,
      @EndUserText.label: 'Task List Group'
      src.TaskListGroup              as TaskListGroup,
      @EndUserText.label: 'Task List Group Counter'
      src.TaskListGroupCounter       as TaskListGroupCounter,
      @EndUserText.label: 'Currency'
      src.Currency                   as Currency,
      @EndUserText.label: 'Last Change Date'
      src.LastChangeDate             as LastChangeDate
}
where src.IsTechnicallyCompleted = '' and src.IsClosed = '' and src.IsMarkedForDeletion = ''
