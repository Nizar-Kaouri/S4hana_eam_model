// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Stock cube enriched with product master data: foreign key to the product dimension (with texts) and
//   product type, group and status as characteristics.
// Example: Unrestricted stock per product group and plant.
// LINK VIEW (ships only when modules "product" AND "material_stock" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Material Stock with Product'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #XL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZMMV_R_StockWithProduct
  as select from ZMMV_R_MaterialStock
  association [0..1] to ZMMV_I_Product as _Product on $projection.Product = _Product.Product
{
      @ObjectModel.foreignKey.association: '_Product'
  key Product,
  key Plant,
  key StorageLocation,
  key Batch,
  key InventoryStockType,
  key InventorySpecialStockType,
      CompanyCode,
      MaterialBaseUnit,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      MatlWrhsStkQtyInMatlBaseUnit,
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      UnrestrictedStockQuantity,

      /* Attributes via associations (path expressions) */
      _Product.ProductType,
      _Product.ProductGroup,
      _Product.CrossPlantStatus,

      /* Associations */
      _Product
}
