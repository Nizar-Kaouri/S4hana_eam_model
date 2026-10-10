// ZEMX EAM migration - status: draft-unverified (no SAP system; never activated)
// Purpose: EquipSerialStock migration extract
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N51C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'EquipSerialStock migration extract'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_EquipSerialStockMig
  as select from ZEMX_I_EquipSerialStock as src
  association [0..1] to ZEMX_I_Equipment as _Parent on _Parent.Equipment = $projection.Equipment
{
      @EndUserText.label: 'Equipment'
  key src.Equipment as Equipment,
      @EndUserText.label: 'Stock Plant'
      src.StockPlant as StockPlant,
      @EndUserText.label: 'Storage Location'
      src.StorageLocation as StorageLocation,
      @EndUserText.label: 'Batch'
      src.Batch as Batch,
      @EndUserText.label: 'Special Stock'
      src.SpecialStock as SpecialStock
}
where _Parent.IsMarkedForDeletion = ''
