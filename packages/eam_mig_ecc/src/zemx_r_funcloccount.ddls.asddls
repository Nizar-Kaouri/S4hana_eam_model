// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of functional locations per MaintenancePlanningPlant, FunctionalLocationCategory on the ECC source (migration scope only); compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool reports every MaintenancePlanningPlant / FunctionalLocationCategory combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_FLC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Functional location count (reconciliation)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #COMPOSITE
define view ZEMX_R_FuncLocCount
  as select from ZEMX_I_FuncLoc
{
  key MaintenancePlanningPlant   as MaintenancePlanningPlant,
  key FunctionalLocationCategory as FunctionalLocationCategory,
      count( * )                 as RecordCount
}
where IsMarkedForDeletion = ''
group by MaintenancePlanningPlant, FunctionalLocationCategory
