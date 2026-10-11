// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per purchase order item: material, plant, quantity, net price and net amount, delivery and
//   invoice completion, deletion code and a derived open flag.
// Example: Open purchase order items per plant; order value per material group.
// TODO-VERIFY[M] MM-043: SAP released view is I_PurchaseOrderItemAPI01 with keys PurchaseOrder, PurchaseOrderItem
// TODO-VERIFY[M] MM-044: elements OrderQuantity, PurchaseOrderQuantityUnit, NetPriceAmount, NetAmount, DocumentCurrency
// TODO-VERIFY[M] MM-045: completion elements IsCompletelyDelivered, IsFinallyInvoiced, PurchasingDocumentDeletionCode
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Purchase Order Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'PurchaseOrderItem'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZMMV_B_PurchaseOrderItem
  as select from I_PurchaseOrderItemAPI01
  association [1..1] to ZMMV_B_PurchaseOrder as _PurchaseOrder on $projection.PurchaseOrder = _PurchaseOrder.PurchaseOrder
  association [0..1] to I_Plant as _Plant on $projection.Plant = _Plant.Plant
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
      @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
      OrderQuantity,
      DocumentCurrency,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      NetPriceAmount,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      NetAmount,
      IsCompletelyDelivered,
      IsFinallyInvoiced,
      PurchasingDocumentDeletionCode,
      @EndUserText.label: 'Item Is Open'
      cast( case when IsCompletelyDelivered = '' and PurchasingDocumentDeletionCode = '' then 'X' else ' ' end as abap_boolean ) as PurchaseOrderItemIsOpen,

      /* Associations */
      _PurchaseOrder,
      _Plant
}
