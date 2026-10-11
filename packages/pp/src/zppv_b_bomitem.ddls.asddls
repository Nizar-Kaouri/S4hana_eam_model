// ZPPV PP VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per BOM item version: component material, item category, item number, component quantity and
//   unit, validity and deletion flag.
// Example: Where-used list of a component; number of components per BOM.
// TODO-VERIFY[H] PP-021: SAP released view is I_BillOfMaterialItemBasic with keys BillOfMaterialCategory, BillOfMaterial, BillOfMaterialVariant, BillOfMaterialItemNodeNumber, BOMItemInternalChangeCount
// TODO-VERIFY[M] PP-022: elements BillOfMaterialComponent, BillOfMaterialItemCategory, BillOfMaterialItemQuantity, BillOfMaterialItemUnit, ValidityStartDate, ValidityEndDate, IsDeleted
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Bill of Material Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'BOMItemInternalChangeCount'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #XL,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZPPV_B_BOMItem
  as select from I_BillOfMaterialItemBasic
{
  key BillOfMaterialCategory,
  key BillOfMaterial,
  key BillOfMaterialVariant,
  key BillOfMaterialItemNodeNumber,
  key BOMItemInternalChangeCount,
      BillOfMaterialComponent,
      BillOfMaterialItemCategory,
      BillOfMaterialItemNumber,
      BillOfMaterialItemUnit,
      @Semantics.quantity.unitOfMeasure: 'BillOfMaterialItemUnit'
      BillOfMaterialItemQuantity,
      ValidityStartDate,
      ValidityEndDate,
      IsDeleted
}
