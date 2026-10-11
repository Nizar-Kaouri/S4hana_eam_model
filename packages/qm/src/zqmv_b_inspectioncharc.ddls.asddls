// ZQMV QM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per inspection characteristic of an inspection lot (per inspection operation) with
//   characteristic text, status, valuation (accepted / rejected), mean value and number of defects.
// Example: Characteristics rejected most often per material; defect counts per inspection specification.
// TODO-VERIFY[H] QM-010: SAP released view for characteristic results is I_InspectionCharacteristic (name not confirmed; results may sit in a separate result view)
// TODO-VERIFY[H] QM-011: keys InspectionLot, InspPlanOperationInternalID, InspectionCharacteristic
// TODO-VERIFY[H] QM-012: result elements InspectionValuationResult, InspectionResultMeanValue, InspectionResultNrOfDefects, InspectionCharacteristicStatus
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Inspection Characteristic Result'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'InspectionCharacteristic'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #XL,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZQMV_B_InspectionCharc
  as select from I_InspectionCharacteristic
  association [1..1] to ZQMV_B_InspectionLot as _InspectionLot on $projection.InspectionLot = _InspectionLot.InspectionLot
{
      @ObjectModel.foreignKey.association: '_InspectionLot'
  key InspectionLot,
  key InspPlanOperationInternalID,
  key InspectionCharacteristic,
      InspectionCharacteristicText,
      InspectionSpecification,
      InspectionCharacteristicStatus,
      InspectionValuationResult,
      InspectionResultMeanValue,
      InspectionResultNrOfDefects,

      /* Associations */
      _InspectionLot
}
