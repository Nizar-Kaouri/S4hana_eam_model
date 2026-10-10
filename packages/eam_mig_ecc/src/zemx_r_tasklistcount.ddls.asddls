// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of current task lists per TaskListType, Plant on the ECC source; compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool reports every TaskListType / Plant combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_TLN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Task list count (reconciliation)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #COMPOSITE
define view ZEMX_R_TaskListCount
  as select from ZEMX_R_TaskListCurrent
{
  key TaskListType as TaskListType,
  key Plant        as Plant,
      count( * )   as RecordCount
}
group by TaskListType, Plant
