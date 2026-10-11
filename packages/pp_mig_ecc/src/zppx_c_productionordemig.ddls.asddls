// ModuPorter PP migration | Release 1.0.0
// Purpose: Read ProductionOrdeMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V001C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProductionOrdeMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPPX_C_ProductionOrdeMig
  as select from ZPPX_I_ProductionOrde as src
{
  key src.ManufacturingOrder as ManufacturingOrder,
      src.ManufacturingOrderType as ManufacturingOrderType,
      src.OrderCategory as OrderCategory,
      src.ManufacturingOrderText as ManufacturingOrderText,
      src.CompanyCode as CompanyCode,
      src.ProductionPlant as ProductionPlant,
      src.ObjectNumber as ObjectNumber
}
