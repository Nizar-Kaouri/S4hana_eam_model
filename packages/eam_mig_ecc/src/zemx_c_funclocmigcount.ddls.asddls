// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of the functional locations delivered by ZEMX_C_FuncLocMig per MaintenancePlanningPlant, FunctionalLocationCategory (values already translated); compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every MaintenancePlanningPlant / FunctionalLocationCategory combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_CFLN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Functional location count (migration)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_FuncLocMigCount
  as select from ZEMX_C_FuncLocMig
{
  key MaintenancePlanningPlant   as MaintenancePlanningPlant,
  key FunctionalLocationCategory as FunctionalLocationCategory,
      count( * )                 as RecordCount
}
group by MaintenancePlanningPlant, FunctionalLocationCategory
