// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read MaterialBOM as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V007R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialBOM'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPPX_I_MaterialBOM
  as select from ZPPX_I_MaterialBOMData as src
{
  key src.Material as Material,
  key src.Plant as Plant,
  key src.BillOfMaterialUsage as BillOfMaterialUsage,
  key src.BillOfMaterial as BillOfMaterial,
  key src.BillOfMaterialVariant as BillOfMaterialVariant,
      src.LotSizeFrom as LotSizeFrom,
      src.LotSizeTo as LotSizeTo
}
