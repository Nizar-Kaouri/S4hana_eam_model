// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of work centers per Plant, WorkCenterCategoryCode on the ECC source (migration scope only); compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool reports every Plant / WorkCenterCategoryCode combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_WCC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Work center count (reconciliation)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #COMPOSITE
define view ZEMX_R_WorkCenterCount
  as select from ZEMX_I_WorkCenter
{
  key Plant                  as Plant,
  key WorkCenterCategoryCode as WorkCenterCategoryCode,
      count( * )             as RecordCount
}
where IsMarkedForDeletion = ''
group by Plant, WorkCenterCategoryCode
