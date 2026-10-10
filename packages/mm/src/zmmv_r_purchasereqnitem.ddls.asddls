// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Requisition cube: number of items, open items and requested quantity per plant, purchasing group and
//   release status.
// Example: Open requisition items per purchasing group and plant.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Purchase Requisition - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZMMV_R_PurchaseReqnItem
  as select from ZMMV_I_PurchaseReqnItem
{
  key PurchaseRequisition,
  key PurchaseRequisitionItem,
      PurchaseRequisitionType,
      Material,
      @ObjectModel.foreignKey.association: '_Plant'
      Plant,
      PurchasingGroup,
      PurchasingOrganization,
      AccountAssignmentCategory,
      BaseUnit,
      DeliveryDate,
      CreationDate,
      PurReqnReleaseStatus,
      IsDeleted,
      IsClosed,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      RequestedQuantity,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Requisition Items'
      cast( 1 as abap.int4 ) as NumberOfReqnItems,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Open Requisition Items'
      cast( case when IsDeleted = '' and IsClosed = '' then 1 else 0 end as abap.int4 ) as NumberOfOpenReqnItems,

      /* Associations */
      _Plant
}
