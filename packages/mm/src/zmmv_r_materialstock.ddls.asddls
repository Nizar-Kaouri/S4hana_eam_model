// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Stock cube: total and unrestricted stock quantity per material, plant, storage location and stock
//   type.
// Example: Unrestricted spare-part stock per plant; stock in quality inspection.
// TODO-VERIFY[M] MM-R01: stock type code '01' = unrestricted-use stock in InventoryStockType
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Material Stock - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #XL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZMMV_R_MaterialStock
  as select from ZMMV_I_MaterialStock
{
  key Product,
      @ObjectModel.foreignKey.association: '_Plant'
  key Plant,
  key StorageLocation,
  key Batch,
  key InventoryStockType,
  key InventorySpecialStockType,
      CompanyCode,
      MaterialBaseUnit,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Stock Quantity'
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      MatlWrhsStkQtyInMatlBaseUnit,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Unrestricted Stock'
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      cast( case when InventoryStockType = '01' then cast( MatlWrhsStkQtyInMatlBaseUnit as abap.dec( 13, 3 ) ) else 0 end
            as abap.quan( 13, 3 ) ) as UnrestrictedStockQuantity,

      /* Associations */
      _Plant
}
