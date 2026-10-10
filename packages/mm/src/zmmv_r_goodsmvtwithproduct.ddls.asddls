// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Goods movement cube enriched with product master data (type, group, texts via the product dimension).
// Example: Issue value per product group and month.
// LINK VIEW (ships only when modules "product" AND "goods_movement" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Goods Movement with Product'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #XXL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZMMV_R_GoodsMvtWithProduct
  as select from ZMMV_R_GoodsMovement
  association [0..1] to ZMMV_I_Product as _Product on $projection.Material = _Product.Product
{
  key MaterialDocumentYear,
  key MaterialDocument,
  key MaterialDocumentItem,
      @ObjectModel.foreignKey.association: '_Product'
      Material,
      Plant,
      GoodsMovementType,
      DebitCreditCode,
      PostingYearMonth,
      CompanyCode,
      CostCenter,
      OrderID,
      MaterialBaseUnit,
      CompanyCodeCurrency,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      ReceiptQuantity,
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      IssueQuantity,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      ReceiptAmount,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      IssueAmount,
      @Aggregation.default: #SUM
      NumberOfMovements,

      /* Attributes via associations (path expressions) */
      _Product.ProductType,
      _Product.ProductGroup,

      /* Associations */
      _Product
}
