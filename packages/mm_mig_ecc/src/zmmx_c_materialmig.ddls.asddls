// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read MaterialMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V001C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_MaterialMig
  as select from ZMMX_I_Material as src
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
