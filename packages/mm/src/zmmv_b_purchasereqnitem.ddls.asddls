// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per purchase requisition item: material, plant, purchasing group, requested quantity,
//   delivery date, release status and deletion / closed flags.
// Example: Open requisitions per purchasing group; requisitions for spare parts not yet converted to orders.
// TODO-VERIFY[H] MM-030: SAP released view is I_PurchaseRequisitionItemAPI01 with keys PurchaseRequisition, PurchaseRequisitionItem
// TODO-VERIFY[H] MM-031: status elements PurReqnReleaseStatus, IsDeleted, IsClosed
// TODO-VERIFY[M] MM-032: elements RequestedQuantity, BaseUnit, DeliveryDate, CreationDate, AccountAssignmentCategory
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Purchase Requisition Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'PurchaseRequisitionItem'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZMMV_B_PurchaseReqnItem
  as select from I_PurchaseRequisitionItemAPI01
  association [0..1] to I_Plant as _Plant on $projection.Plant = _Plant.Plant
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
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      RequestedQuantity,
      DeliveryDate,
      CreationDate,
      PurReqnReleaseStatus,
      IsDeleted,
      IsClosed,

      /* Associations */
      _Plant
}
