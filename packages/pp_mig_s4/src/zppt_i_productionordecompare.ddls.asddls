// ModuPorter PP migration | Release 1.0.0
// Purpose: Read ProductionOrdeCompare as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProductionOrdeCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZPPT_I_ProductionOrdeCompare
  as select from I_ManufacturingOrder as src
{
  key src.ManufacturingOrder as ManufacturingOrder,
      src.ManufacturingOrderType as ManufacturingOrderType,
      src.ManufacturingOrderText as ManufacturingOrderText,
      src.CompanyCode as CompanyCode,
      src.ProductionPlant as ProductionPlant
}
