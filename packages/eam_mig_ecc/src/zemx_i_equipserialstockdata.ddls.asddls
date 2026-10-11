// ModuPorter EAM migration | Release 1.0.0
// Purpose: EquipSerialStock source data
// Example: Export the selected migration scope; validate keys and row counts before loading.
// Compatibility note: Confirm EQBS keys, all selected fields and meanings on the source release; posting-interface targets are provisional.
@AbapCatalog.sqlViewName: 'ZEMX_N51B'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'EquipSerialStock source data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_EquipSerialStockData
  as select from eqbs as t
{
      @EndUserText.label: 'Equipment'
  key t.equnr as Equipment,
      @EndUserText.label: 'Stock Plant'
      t.b_werk as StockPlant,
      @EndUserText.label: 'Storage Location'
      t.b_lager as StorageLocation,
      @EndUserText.label: 'Batch'
      t.b_charge as Batch,
      @EndUserText.label: 'Special Stock'
      t.sobkz as SpecialStock
}
