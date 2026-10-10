// ZSDV SD VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Delivery item cube: delivered quantity and number of items per shipping point, plant, material and
//   ship-to party, with goods-issue and on-time flags from the header.
// Example: Share of items delivered on time per shipping point.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Outbound Delivery Item - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZSDV_R_DeliveryItem
  as select from ZSDV_I_DeliveryItem
{
      @ObjectModel.foreignKey.association: '_Delivery'
  key DeliveryDocument,
  key DeliveryDocumentItem,
      Material,
      @ObjectModel.foreignKey.association: '_Plant'
      Plant,
      StorageLocation,
      DeliveryQuantityUnit,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Delivered Quantity'
      @Semantics.quantity.unitOfMeasure: 'DeliveryQuantityUnit'
      ActualDeliveryQuantity,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Delivery Items'
      cast( 1 as abap.int4 ) as NumberOfDeliveryItems,

      /* Delivery header characteristics */
      _Delivery.ShippingPoint,
      _Delivery.SalesOrganization,
      _Delivery.ShipToParty,
      _Delivery.PlannedGoodsIssueDate,
      _Delivery.GoodsIssueIsPosted,
      _Delivery.DeliveryIsOnTime,

      /* Associations */
      _Delivery,
      _Plant
}
