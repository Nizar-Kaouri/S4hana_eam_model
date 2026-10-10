// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
  key src.MaintenanceOrder           as MaintenanceOrder,
      src.MaintenanceOrderType       as MaintenanceOrderType,
      src.MaintenanceOrderDesc       as MaintenanceOrderDesc,
      src.MaintenanceActivityType    as MaintenanceActivityType,
      src.MaintPriority              as MaintPriority,
      src.MaintOrdBasicStartDate     as MaintOrdBasicStartDate,
      src.MaintOrdBasicEndDate       as MaintOrdBasicEndDate,
      src.MaintenancePlanningPlant   as MaintenancePlanningPlant,
      src.MaintenancePlannerGroup    as MaintenancePlannerGroup,
      src.MainWorkCenter             as MainWorkCenter,
      src.MainWorkCenterPlant        as MainWorkCenterPlant,
      src.MaintenancePlant           as MaintenancePlant,
      src.CompanyCode                as CompanyCode,
      src.BusinessArea               as BusinessArea,
      src.ControllingArea            as ControllingArea,
      src.ResponsibleCostCenter      as ResponsibleCostCenter,
      src.CostCenter                 as CostCenter,
      src.MaintenanceNotification    as MaintenanceNotification,
      src.Equipment                  as Equipment,
      src.FunctionalLocation         as FunctionalLocation,
      src.MaintenancePlan            as MaintenancePlan,
      src.MaintenanceItem            as MaintenanceItem,
      src.MaintObjectSystemCondition as MaintObjectSystemCondition,
      src.TaskListType               as TaskListType,
      src.TaskListGroup              as TaskListGroup,
      src.TaskListGroupCounter       as TaskListGroupCounter,
      src.Currency                   as Currency,
      src.LastChangeDate             as LastChangeDate
}
where src.IsTechnicallyCompleted = '' and src.IsClosed = '' and src.IsMarkedForDeletion = ''
