// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read BOMItem as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V010R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BOMItem'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPPX_I_BOMItem
  as select from ZPPX_I_BOMItemData as src
{
  key src.BOMCategory as BOMCategory,
  key src.BillOfMaterial as BillOfMaterial,
  key src.BOMNode as BOMNode,
  key src.InternalCounter as InternalCounter,
      src.ValidFromDate as ValidFromDate,
      src.ChangeNumber as ChangeNumber,
      src.DeletionFlag as DeletionFlag,
      src.Component as Component,
      src.ItemNumber as ItemNumber,
      src.ComponentQuantity as ComponentQuantity,
      src.Unit as Unit
}
