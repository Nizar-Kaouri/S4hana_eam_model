// ModuPorter PP migration | Release 1.0.0
// Purpose: Read MaterialBOMMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V007C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialBOMMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPPX_C_MaterialBOMMig
  as select from ZPPX_I_MaterialBOM as src
{
  key src.Material as Material,
  key src.Plant as Plant,
  key src.BillOfMaterialUsage as BillOfMaterialUsage,
  key src.BillOfMaterial as BillOfMaterial,
  key src.BillOfMaterialVariant as BillOfMaterialVariant,
      src.LotSizeFrom as LotSizeFrom,
      src.LotSizeTo as LotSizeTo
}
