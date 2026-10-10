// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per measurement document (reading) with date/time, reading in the measuring point
//   unit, counter reading, valuation code, text and cancellation flag.
// Example: Trend of a temperature or vibration reading; latest counter reading per measuring point.
// Module measurement_document has a hard dependency on measuring_point (association _MeasuringPoint).
// TODO-VERIFY[M] MD-001: I_MeasurementDocument exists, is released (C1) and its key element is MeasurementDocument
// TODO-VERIFY[M] MD-002: elements MsmtRdngDate, MsmtRdngTime, MsmtRdngByUser, MsmtValuationCode, MeasurementDocumentText
// TODO-VERIFY[H] MD-003: reading elements MeasurementReading and MeasurementCounterReading (FLTP in the measuring point unit)
// TODO-VERIFY[H] MD-004: cancellation indicator (IMRG-CANCL equivalent) assumed MsmtDocumentIsCancelled
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Measurement Document'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MeasurementDocument'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #XL,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZEAM_I_MeasDocument
  as select from I_MeasurementDocument
  association [1..1] to ZEAM_I_MeasPoint as _MeasuringPoint on $projection.MeasuringPoint = _MeasuringPoint.MeasuringPoint
{
  key MeasurementDocument,
      @ObjectModel.foreignKey.association: '_MeasuringPoint'
      MeasuringPoint,
      MsmtRdngDate,
      MsmtRdngTime,
      MsmtRdngByUser,
      MeasurementReading,
      MeasurementCounterReading,
      MsmtValuationCode,
      @Semantics.text: true
      MeasurementDocumentText,
      MsmtDocumentIsCancelled,

      /* Associations */
      _MeasuringPoint
}
