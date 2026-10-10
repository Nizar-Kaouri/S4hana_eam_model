// ZSDV SD VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per delivery item: material, plant, storage location, delivered quantity and the reference
//   sales order item.
// Example: Delivered quantity per material and plant; deliveries per sales order.
// TODO-VERIFY[M] SD-012: I_DeliveryDocumentItem elements ActualDeliveryQuantity, DeliveryQuantityUnit, ReferenceSDDocument, ReferenceSDDocumentItem
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Outbound Delivery Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'DeliveryDocumentItem'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZSDV_I_DeliveryItem
  as select from I_DeliveryDocumentItem
  association [1..1] to ZSDV_I_OutboundDelivery as _Delivery on $projection.DeliveryDocument = _Delivery.DeliveryDocument
  association [0..1] to I_Plant as _Plant on $projection.Plant = _Plant.Plant
{
      @ObjectModel.foreignKey.association: '_Delivery'
  key DeliveryDocument,
  key DeliveryDocumentItem,
      Material,
      @ObjectModel.foreignKey.association: '_Plant'
      Plant,
      StorageLocation,
      DeliveryQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'DeliveryQuantityUnit'
      ActualDeliveryQuantity,
      ReferenceSDDocument,
      ReferenceSDDocumentItem,

      /* Associations */
      _Delivery,
      _Plant
}
