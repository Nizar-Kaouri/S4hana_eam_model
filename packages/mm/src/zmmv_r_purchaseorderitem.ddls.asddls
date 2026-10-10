// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Purchase order item cube: ordered quantity, net value, number of (open) items, with supplier,
//   purchasing organization and group from the header.
// Example: Purchase volume per supplier and material group; open items per purchasing group.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Purchase Order Item - Cube'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZMMV_R_PurchaseOrderItem
  as select from ZMMV_I_PurchaseOrderItem
{
      @ObjectModel.foreignKey.association: '_PurchaseOrder'
  key PurchaseOrder,
  key PurchaseOrderItem,
      PurchaseOrderItemCategory,
      Material,
      MaterialGroup,
      @ObjectModel.foreignKey.association: '_Plant'
      Plant,
      StorageLocation,
      AccountAssignmentCategory,
      PurchaseOrderQuantityUnit,
      DocumentCurrency,
      IsCompletelyDelivered,
      IsFinallyInvoiced,
      PurchasingDocumentDeletionCode,
      PurchaseOrderItemIsOpen,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
      OrderQuantity,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      NetAmount,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Items'
      cast( 1 as abap.int4 ) as NumberOfItems,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Open Items'
      cast( case when PurchaseOrderItemIsOpen = 'X' then 1 else 0 end as abap.int4 ) as NumberOfOpenItems,

      /* Order header characteristics */
      _PurchaseOrder.PurchaseOrderType,
      _PurchaseOrder.Supplier,
      _PurchaseOrder.PurchasingOrganization,
      _PurchaseOrder.PurchasingGroup,
      _PurchaseOrder.CompanyCode,
      _PurchaseOrder.PurchaseOrderDate,

      /* Associations */
      _PurchaseOrder,
      _Plant
}
