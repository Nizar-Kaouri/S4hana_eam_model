// ModuPorter PP migration | Release 1.0.0
// Purpose: Read MaterialBOMData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPPX_V007'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialBOMData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPPX_B_MaterialBOMData
  as select from mast as src
{
  key src.matnr as Material,
  key src.werks as Plant,
  key src.stlan as BillOfMaterialUsage,
  key src.stlnr as BillOfMaterial,
  key src.stlal as BillOfMaterialVariant,
      src.losvn as LotSizeFrom,
      src.losbs as LotSizeTo
}
