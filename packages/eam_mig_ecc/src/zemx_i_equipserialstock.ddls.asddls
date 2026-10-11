// ModuPorter EAM migration | Release 1.0.0
// Purpose: EquipSerialStock migration business data
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N51I'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'EquipSerialStock migration business data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_EquipSerialStock
  as select from ZEMX_B_EquipSerialStockData as b
{
      @EndUserText.label: 'Equipment'
  key b.Equipment as Equipment,
      @EndUserText.label: 'Stock Plant'
      b.StockPlant as StockPlant,
      @EndUserText.label: 'Storage Location'
      b.StorageLocation as StorageLocation,
      @EndUserText.label: 'Batch'
      b.Batch as Batch,
      @EndUserText.label: 'Special Stock'
      b.SpecialStock as SpecialStock
}
