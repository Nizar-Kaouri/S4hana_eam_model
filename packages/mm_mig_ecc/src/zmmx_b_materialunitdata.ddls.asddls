// ModuPorter MM migration | Release 1.0.0
// Purpose: Read MaterialUnitData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZMMX_V005'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialUnitData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_B_MaterialUnitData
  as select from marm as src
{
  key src.matnr as Product,
  key src.meinh as AlternativeUnit,
      src.umrez as Numerator,
      src.umren as Denominator,
      src.ean11 as InternationalArticleNumber
}
