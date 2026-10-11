// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Purchase order item cube enriched with product type and group.
// Example: Purchase volume per product group and supplier.
// LINK VIEW (ships only when modules "product" AND "purchase_order" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Purchase Order Item with Product'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZMMV_I_POItemWithProduct
  as select from ZMMV_I_PurchaseOrderItem
  association [0..1] to ZMMV_B_Product as _Product on $projection.Material = _Product.Product
{
  key PurchaseOrder,
  key PurchaseOrderItem,
      @ObjectModel.foreignKey.association: '_Product'
      Material,
      MaterialGroup,
      Plant,
      PurchaseOrderItemIsOpen,
      PurchaseOrderQuantityUnit,
      DocumentCurrency,
      Supplier,
      PurchasingOrganization,
      PurchasingGroup,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
      OrderQuantity,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      NetAmount,
      @Aggregation.default: #SUM
      NumberOfItems,
      @Aggregation.default: #SUM
      NumberOfOpenItems,

      /* Attributes via associations (path expressions) */
      _Product.ProductType,
      _Product.ProductGroup,

      /* Associations */
      _Product
}
