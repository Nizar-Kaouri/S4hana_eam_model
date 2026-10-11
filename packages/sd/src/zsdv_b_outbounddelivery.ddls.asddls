// ZSDV SD VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per outbound delivery: type, shipping point, sales organization, sold-to and ship-to party,
//   delivery date, planned and actual goods issue date, goods movement and picking status; derived goods-issue and
//   on-time flags.
// Example: On-time delivery rate per shipping point; deliveries without goods issue.
// TODO-VERIFY[M] SD-010: I_DeliveryDocument is released with key DeliveryDocument
// TODO-VERIFY[M] SD-011: elements PlannedGoodsIssueDate, ActualGoodsMovementDate, OverallGoodsMovementStatus, OverallPickingStatus, ShipToParty
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Outbound Delivery'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'DeliveryDocument'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZSDV_B_OutboundDelivery
  as select from I_DeliveryDocument
{
  key DeliveryDocument,
      DeliveryDocumentType,
      ShippingPoint,
      SalesOrganization,
      SoldToParty,
      ShipToParty,
      DeliveryDate,
      PlannedGoodsIssueDate,
      ActualGoodsMovementDate,
      OverallGoodsMovementStatus,
      OverallPickingStatus,
      CreationDate,
      @EndUserText.label: 'Goods Issue Posted'
      cast( case when OverallGoodsMovementStatus = 'C' then 'X' else ' ' end as abap_boolean ) as GoodsIssueIsPosted,
      @EndUserText.label: 'Delivered on Time'
      cast( case when OverallGoodsMovementStatus = 'C' and ActualGoodsMovementDate <= PlannedGoodsIssueDate then 'X' else ' ' end as abap_boolean ) as DeliveryIsOnTime
}
