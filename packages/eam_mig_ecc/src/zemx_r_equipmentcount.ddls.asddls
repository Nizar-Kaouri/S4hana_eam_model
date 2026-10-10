// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of equipment per MaintenancePlanningPlant, EquipmentCategory on the ECC source (migration scope only); compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool reports every MaintenancePlanningPlant / EquipmentCategory combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_EQC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Equipment count (reconciliation)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #COMPOSITE
define view ZEMX_R_EquipmentCount
  as select from ZEMX_I_Equipment
{
  key MaintenancePlanningPlant as MaintenancePlanningPlant,
  key EquipmentCategory        as EquipmentCategory,
      count( * )               as RecordCount
}
where IsMarkedForDeletion = ''
group by MaintenancePlanningPlant, EquipmentCategory
