// ZBRG Bridge VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Production order operations with the shared work center master of the EAM product (external ID,
//   plant, category, texts).
// Example: Production and maintenance load on the same work center.
// LINK VIEW (ships only when modules "eam:work_center" AND "pp:production_order_operation" are selected).
// TODO-VERIFY[L] BRG-004: production work centers are type 'A' like maintenance work centers (EAM work center view filters on type 'A')
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Production Operation with Work Center'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'ManufacturingOrderOperation'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZBRG_I_ProdOpWithWorkCenter
  as select from ZPPV_I_ProductionOrderOp
  association [0..1] to ZEAM_I_WorkCenter as _WorkCenter on $projection.WorkCenterInternalID = _WorkCenter.WorkCenterInternalID
{
  key ManufacturingOrder,
  key ManufacturingOrderSequence,
  key ManufacturingOrderOperation,
      @ObjectModel.foreignKey.association: '_WorkCenter'
      WorkCenterInternalID,
      WorkCenterTypeCode,
      OperationControlProfile,

      /* Attributes via associations (path expressions) */
      _WorkCenter.WorkCenter,
      _WorkCenter.Plant as WorkCenterPlant,
      _WorkCenter.WorkCenterCategoryCode,

      /* Associations */
      _WorkCenter
}
