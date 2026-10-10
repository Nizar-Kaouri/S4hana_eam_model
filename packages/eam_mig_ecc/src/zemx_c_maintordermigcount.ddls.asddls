// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of the open maintenance orders delivered by ZEMX_C_MaintOrderMig per MaintenanceOrderType, MaintenancePlanningPlant (values already translated); compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every MaintenanceOrderType / MaintenancePlanningPlant combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_CORN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Open maintenance order count (migration)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MaintOrderMigCount
  as select from ZEMX_C_MaintOrderMig
{
  key MaintenanceOrderType     as MaintenanceOrderType,
  key MaintenancePlanningPlant as MaintenancePlanningPlant,
      count( * )               as RecordCount
}
group by MaintenanceOrderType, MaintenancePlanningPlant
