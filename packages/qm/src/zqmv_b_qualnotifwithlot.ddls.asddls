// ZQMV QM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Quality notification with its inspection lot (origin and usage decision via path expressions).
// Example: Supplier complaints with the usage decision of the underlying goods-receipt lot.
// LINK VIEW (ships only when modules "inspection_lot" AND "quality_notification" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Quality Notification with Inspection Lot'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'QualityNotification'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZQMV_B_QualNotifWithLot
  as select from ZQMV_B_QualityNotif
  association [0..1] to ZQMV_B_InspectionLot as _InspectionLot on $projection.InspectionLot = _InspectionLot.InspectionLot
{
  key QualityNotification,
      NotificationType,
      Material,
      Plant,
      Supplier,
      @ObjectModel.foreignKey.association: '_InspectionLot'
      InspectionLot,

      /* Attributes via associations (path expressions) */
      _InspectionLot.InspectionLotOrigin,
      _InspectionLot.InspLotUsageDecisionValuation,

      /* Associations */
      _InspectionLot
}
