// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of the work centers delivered by ZEMX_C_WorkCenterMig per Plant, WorkCenterCategoryCode; compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every Plant / WorkCenterCategoryCode combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_CWCN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Work center count (migration)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_WorkCenterMigCount
  as select from ZEMX_C_WorkCenterMig
{
      @EndUserText.label: 'Plant'
  key Plant                  as Plant,
      @EndUserText.label: 'Work Center Category Code'
  key WorkCenterCategoryCode as WorkCenterCategoryCode,
      @EndUserText.label: 'Record Count'
      count( * )             as RecordCount
}
group by Plant, WorkCenterCategoryCode
