// ModuPorter PP migration | Release 1.0.0
// Purpose: Read ProductionItemData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPPX_V003'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProductionItemData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPPX_B_ProductionItemData
  as select from afpo as src
{
  key src.aufnr as ManufacturingOrder,
  key src.posnr as ManufacturingOrderItem,
      src.matnr as Material,
      src.dwerk as ProductionPlant,
      src.psmng as PlannedQuantity,
      src.meins as Unit
}
