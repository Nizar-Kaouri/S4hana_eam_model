// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
define view ZEMX_I_OrderHeaderPlanning
  as select from afko
{
  key afko.aufnr as MaintenanceOrder,
      afko.gstrp as MaintOrdBasicStartDate,
      afko.gltrp as MaintOrdBasicEndDate,
      afko.aufpl as OrderRoutingNumber,
      afko.plnty as TaskListType,
      afko.plnnr as TaskListGroup,
      afko.plnal as TaskListGroupCounter
}
