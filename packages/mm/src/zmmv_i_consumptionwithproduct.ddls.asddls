// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Consumption cube enriched with product type and group (spare-part classes).
// Example: Spare-part consumption value per product group and plant.
// LINK VIEW (ships only when modules "product" AND "rpt_material_consumption" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Material Consumption with Product'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #XL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZMMV_I_ConsumptionWithProduct
  as select from ZMMV_I_MaterialConsumption
  association [0..1] to ZMMV_B_Product as _Product on $projection.Material = _Product.Product
{
  key MaterialDocumentYear,
  key MaterialDocument,
  key MaterialDocumentItem,
      @ObjectModel.foreignKey.association: '_Product'
      Material,
      Plant,
      GoodsMovementType,
      PostingYearMonth,
      CostCenter,
      OrderID,
      CompanyCode,
      MaterialBaseUnit,
      CompanyCodeCurrency,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      ConsumptionQuantity,
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      ConsumptionReversalQuantity,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      ConsumptionAmount,
      @Aggregation.default: #SUM
      NumberOfMovements,

      /* Attributes via associations (path expressions) */
      _Product.ProductType,
      _Product.ProductGroup,

      /* Associations */
      _Product
}
