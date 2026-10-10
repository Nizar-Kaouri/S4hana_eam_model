// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of the task lists delivered by ZEMX_C_TaskListMig per TaskListType, Plant; compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every TaskListType / Plant combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_CTLN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Task list count (migration)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_TaskListMigCount
  as select from ZEMX_C_TaskListMig
{
  key TaskListType as TaskListType,
  key Plant        as Plant,
      count( * )   as RecordCount
}
group by TaskListType, Plant
