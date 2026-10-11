// ModuPorter MM migration | Release 1.0.0
// Purpose: Read Material as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V001R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Material'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_Material
  as select from ZMMX_I_MaterialData as src
{
  key src.Product as Product,
      src.ProductType as ProductType,
      src.ProductGroup as ProductGroup,
      src.BaseUnit as BaseUnit,
      src.GrossWeight as GrossWeight,
      src.NetWeight as NetWeight,
      src.WeightUnit as WeightUnit,
      src.DeletionFlag as DeletionFlag
}
