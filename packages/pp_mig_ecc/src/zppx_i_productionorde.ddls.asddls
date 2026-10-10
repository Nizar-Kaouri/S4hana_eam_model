// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ProductionOrde as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V001R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProductionOrde'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPPX_I_ProductionOrde
  as select from ZPPX_I_ProductionOrdeData as src
{
  key src.ManufacturingOrder as ManufacturingOrder,
      src.ManufacturingOrderType as ManufacturingOrderType,
      src.OrderCategory as OrderCategory,
      src.ManufacturingOrderText as ManufacturingOrderText,
      src.CompanyCode as CompanyCode,
      src.ProductionPlant as ProductionPlant,
      src.ObjectNumber as ObjectNumber
}
