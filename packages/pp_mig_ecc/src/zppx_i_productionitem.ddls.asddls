// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ProductionItem as source candidates; approve the key-date population before posting.
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
  as select from ZPPX_I_ProductionItemData as src
{
  key src.ManufacturingOrder as ManufacturingOrder,
  key src.ManufacturingOrderItem as ManufacturingOrderItem,
      src.Material as Material,
      src.ProductionPlant as ProductionPlant,
      src.PlannedQuantity as PlannedQuantity,
      src.Unit as Unit
}
