// ZBRG Bridge VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Production order cube enriched with product type and group from the MM product.
// Example: Yield vs. plan per product group and plant.
// LINK VIEW (ships only when modules "mm:product" AND "pp:production_order" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Production Order with Product'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZBRG_I_ProdOrderWithProduct
  as select from ZPPV_I_ProductionOrder
  association [0..1] to ZMMV_B_Product as _Product on $projection.Material = _Product.Product
{
  key ManufacturingOrder,
      @ObjectModel.foreignKey.association: '_Product'
      Material,
      ProductionPlant,
      MRPController,
      ProductionOrderIsOpen,
      PlannedEndYearMonth,
      ProductionUnit,

      /* Measures */
      @Aggregation.default: #SUM
      NumberOfProductionOrders,
      @Aggregation.default: #SUM
      NumberOfOpenOrders,
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      MfgOrderPlannedTotalQty,
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      MfgOrderConfirmedYieldQty,

      /* Attributes via associations (path expressions) */
      _Product.ProductType,
      _Product.ProductGroup,

      /* Associations */
      _Product
}
