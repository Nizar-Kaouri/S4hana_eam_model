// ModuPorter MM migration | Release 1.0.0
// Purpose: Read MaterialData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZMMX_V001'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_B_MaterialData
  as select from mara as src
{
  key src.matnr as Product,
      src.mtart as ProductType,
      src.matkl as ProductGroup,
      src.meins as BaseUnit,
      src.brgew as GrossWeight,
      src.ntgew as NetWeight,
      src.gewei as WeightUnit,
      src.lvorm as DeletionFlag
}
