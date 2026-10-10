// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Maintenance order operations with an association to their work center (dimension) and the
//   work center description / category via path expressions.
// Example: Operation list with work center description; navigate from an operation to its work center.
// LINK VIEW (ships only when modules "maintenance_order" AND "work_center" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Order Operation with Work Center'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MaintenanceOrderSubOperation'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZEAM_I_MaintOpWithWorkCenter
  as select from ZEAM_I_MaintOrderOperation
  association [0..1] to ZEAM_I_WorkCenter as _WorkCenter on $projection.WorkCenterInternalID = _WorkCenter.WorkCenterInternalID
{
  key MaintenanceOrder,
  key MaintenanceOrderOperation,
  key MaintenanceOrderSubOperation,
      @ObjectModel.foreignKey.association: '_WorkCenter'
      WorkCenterInternalID,
      WorkCenter,
      Plant,
      OperationControlKey,

      /* Work center attributes (path expressions) */
      _WorkCenter.WorkCenterCategoryCode,
      _WorkCenter.WorkCenterResponsible,
      _WorkCenter._Text[1: Language = $session.system_language].WorkCenterText as WorkCenterText,

      /* Associations */
      _WorkCenter
}
