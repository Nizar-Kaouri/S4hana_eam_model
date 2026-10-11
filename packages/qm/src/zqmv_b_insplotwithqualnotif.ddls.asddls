// ZQMV QM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Inspection lot with a to-many association to the quality notifications created for it (defects
//   recorded from results recording).
// Example: Rejected lots and the complaints that followed.
// LINK VIEW (ships only when modules "inspection_lot" AND "quality_notification" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Inspection Lot with Quality Notifications'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'InspectionLot'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZQMV_B_InspLotWithQualNotif
  as select from ZQMV_B_InspectionLot
  association [0..*] to ZQMV_B_QualityNotif as _QualityNotification on $projection.InspectionLot = _QualityNotification.InspectionLot
{
  key InspectionLot,
      Material,
      Plant,
      Supplier,
      InspectionLotOrigin,
      InspLotIsRejected,

      /* Associations */
      _QualityNotification
}
