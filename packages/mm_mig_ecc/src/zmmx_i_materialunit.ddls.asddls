// ModuPorter MM migration | Release 1.0.0
// Purpose: Read MaterialUnit as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V005R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialUnit'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_MaterialUnit
  as select from ZMMX_B_MaterialUnitData as src
{
  key src.Product as Product,
  key src.AlternativeUnit as AlternativeUnit,
      src.Numerator as Numerator,
      src.Denominator as Denominator,
      src.InternationalArticleNumber as InternationalArticleNumber
}
