// ModuPorter EAM migration | Release 1.0.0
// Purpose: Record count of the equipment delivered by ZEMX_C_EquipmentMig per MaintenancePlanningPlant, EquipmentCategory; compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every MaintenancePlanningPlant / EquipmentCategory combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_CEQN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Equipment count (migration)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_EquipmentMigCount
  as select from ZEMX_C_EquipmentMig
{
      @EndUserText.label: 'Maintenance Planning Plant'
  key MaintenancePlanningPlant as MaintenancePlanningPlant,
      @EndUserText.label: 'Equipment Category'
  key EquipmentCategory        as EquipmentCategory,
      @EndUserText.label: 'Record Count'
      count( * )               as RecordCount
}
group by MaintenancePlanningPlant, EquipmentCategory
