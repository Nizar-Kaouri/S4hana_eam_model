// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Assignment of equipment task lists (type E) to equipment and of functional location task lists (type T) to functional locations (EAPL).
// Example: Find the task lists of equipment 10000001.
@AbapCatalog.sqlViewName: 'ZEMX_EAPL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Task list object assignment'
@ObjectModel.representativeKey: 'TaskListGroupCounter'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #BASIC
define view ZEMX_I_TaskListObjectAssgmt
  as select from eapl
{
      @EndUserText.label: 'Task List Type'
  key eapl.plnty as TaskListType,
      @EndUserText.label: 'Task List Group'
  key eapl.plnnr as TaskListGroup,
      @EndUserText.label: 'Task List Group Counter'
  key eapl.plnal as TaskListGroupCounter,
      // TODO-VERIFY[H] XTL-005: EAPL structure (PLNTY, PLNNR, PLNAL, EQUNR, TPLNR) and key
      @EndUserText.label: 'Equipment'
      eapl.equnr as Equipment,
      @EndUserText.label: 'Functional Location'
      eapl.tplnr as FunctionalLocation
}
