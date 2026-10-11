// ModuPorter PP migration | Release 1.0.0
// Purpose: Read BOMSelectionMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V009C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BOMSelectionMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPPX_C_BOMSelectionMig
  as select from ZPPX_I_BOMSelection as src
{
  key src.BOMCategory as BOMCategory,
  key src.BillOfMaterial as BillOfMaterial,
  key src.BillOfMaterialVariant as BillOfMaterialVariant,
  key src.BOMNode as BOMNode,
  key src.InternalCounter as InternalCounter,
      src.ValidFromDate as ValidFromDate,
      src.ChangeNumber as ChangeNumber,
      src.DeletionFlag as DeletionFlag
}
