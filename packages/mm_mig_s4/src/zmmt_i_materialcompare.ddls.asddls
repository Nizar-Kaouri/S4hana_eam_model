// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read MaterialCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] MMT-001: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZMMT_I_MaterialCompare
  as select from I_Product as src
{
  key src.Product as Product,
      src.ProductType as ProductType,
      src.ProductGroup as ProductGroup,
      src.BaseUnit as BaseUnit,
      src.GrossWeight as GrossWeight,
      src.NetWeight as NetWeight,
      src.WeightUnit as WeightUnit
}
