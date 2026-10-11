// ModuPorter PP migration | Release 1.0.0
// Purpose: Read ProductionItem as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V003R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProductionItem'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPPX_I_ProductionItem
  as select from ZPPX_B_ProductionItemData as src
{
  key src.ManufacturingOrder as ManufacturingOrder,
  key src.ManufacturingOrderItem as ManufacturingOrderItem,
      src.Material as Material,
      src.ProductionPlant as ProductionPlant,
      src.PlannedQuantity as PlannedQuantity,
      src.Unit as Unit
}
