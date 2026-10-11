// ModuPorter PP migration | Release 1.0.0
// Purpose: Read ProductionItemMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V003C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProductionItemMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPPX_C_ProductionItemMig
  as select from ZPPX_I_ProductionItem as src
{
  key src.ManufacturingOrder as ManufacturingOrder,
  key src.ManufacturingOrderItem as ManufacturingOrderItem,
      src.Material as Material,
      src.ProductionPlant as ProductionPlant,
      src.PlannedQuantity as PlannedQuantity,
      src.Unit as Unit
}
