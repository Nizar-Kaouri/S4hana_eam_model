// ModuPorter EAM migration | Release 1.0.0
// Purpose: Order header planning data (AFKO): basic dates, routing number and the task list used.
// Example: Read the basic dates of order 4000001.
@AbapCatalog.sqlViewName: 'ZEMX_AFKO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Order header planning data'
@ObjectModel.representativeKey: 'MaintenanceOrder'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_B_OrderHeaderPlanning
  as select from afko
{
      @EndUserText.label: 'Maintenance Order'
  key afko.aufnr as MaintenanceOrder,
      @EndUserText.label: 'Maint Ord Basic Start Date'
      afko.gstrp as MaintOrdBasicStartDate,
      @EndUserText.label: 'Maint Ord Basic End Date'
      afko.gltrp as MaintOrdBasicEndDate,
      @EndUserText.label: 'Order Routing Number'
      afko.aufpl as OrderRoutingNumber,
      @EndUserText.label: 'Task List Type'
      afko.plnty as TaskListType,
      @EndUserText.label: 'Task List Group'
      afko.plnnr as TaskListGroup,
      @EndUserText.label: 'Task List Group Counter'
      afko.plnal as TaskListGroupCounter
}
