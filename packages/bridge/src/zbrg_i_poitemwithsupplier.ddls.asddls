// ZBRG Bridge VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Purchase order item cube enriched with the supplier master of the FI product (country, account group,
//   name via the dimension).
// Example: Purchase volume per supplier country.
// LINK VIEW (ships only when modules "fi:supplier" AND "mm:purchase_order" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Purchase Order Item with Supplier'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZBRG_I_POItemWithSupplier
  as select from ZMMV_I_PurchaseOrderItem
  association [0..1] to ZFIV_B_Supplier as _Supplier on $projection.Supplier = _Supplier.Supplier
{
  key PurchaseOrder,
  key PurchaseOrderItem,
      @ObjectModel.foreignKey.association: '_Supplier'
      Supplier,
      PurchasingOrganization,
      PurchasingGroup,
      Plant,
      MaterialGroup,
      PurchaseOrderItemIsOpen,
      DocumentCurrency,
      PurchaseOrderQuantityUnit,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      NetAmount,
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
      OrderQuantity,
      @Aggregation.default: #SUM
      NumberOfItems,
      @Aggregation.default: #SUM
      NumberOfOpenItems,

      /* Attributes via associations (path expressions) */
      _Supplier.Country as SupplierCountry,
      _Supplier.SupplierAccountGroup,

      /* Associations */
      _Supplier
}
