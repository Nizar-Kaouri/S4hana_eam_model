// ZPPV PP VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: BOM item cube (deleted items excluded): number of items and component quantity per BOM, component and
//   item category.
// Example: Components used in the most BOMs; BOM size per BOM category.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Bill of Material Item - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #XL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZPPV_R_BOMItem
  as select from ZPPV_I_BOMItem
{
  key BillOfMaterialCategory,
  key BillOfMaterial,
  key BillOfMaterialVariant,
  key BillOfMaterialItemNodeNumber,
  key BOMItemInternalChangeCount,
      BillOfMaterialComponent,
      BillOfMaterialItemCategory,
      BillOfMaterialItemUnit,
      ValidityStartDate,
      ValidityEndDate,
      IsDeleted,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of BOM Items'
      cast( 1 as abap.int4 ) as NumberOfBOMItems,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Component Quantity'
      @Semantics.quantity.unitOfMeasure: 'BillOfMaterialItemUnit'
      BillOfMaterialItemQuantity
}
where
  IsDeleted = ''
