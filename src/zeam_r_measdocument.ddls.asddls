// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Reading cube (cancelled documents excluded): number of readings, minimum / maximum / summed
//   reading as decimals, with measuring point characteristics via path expressions.
// Example: Maximum vibration per equipment and month; number of readings per measuring point category.
// TODO-VERIFY[M] MD-R01: fltp_to_dec( ... as abap.dec(31,6) ) conversion of the FLTP readings
// TODO-VERIFY[L] MD-R02: @Aggregation.default: #MIN / #MAX on decimal measures in a #CUBE view entity
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Measurement Document - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #XL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEAM_R_MeasDocument
  as select from ZEAM_I_MeasDocument
{
  key MeasurementDocument,
      @ObjectModel.foreignKey.association: '_MeasuringPoint'
      MeasuringPoint,
      MsmtRdngDate,
      MsmtValuationCode,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Readings'
      cast( 1 as abap.int4 ) as NumberOfReadings,
      @Aggregation.default: #MIN
      @EndUserText.label: 'Minimum Reading'
      fltp_to_dec( MeasurementReading as abap.dec( 31, 6 ) ) as MinimumReading,
      @Aggregation.default: #MAX
      @EndUserText.label: 'Maximum Reading'
      fltp_to_dec( MeasurementReading as abap.dec( 31, 6 ) ) as MaximumReading,
      @Aggregation.default: #MAX
      @EndUserText.label: 'Latest Counter Reading'
      fltp_to_dec( MeasurementCounterReading as abap.dec( 31, 6 ) ) as MaximumCounterReading,

      /* Measuring point characteristics */
      _MeasuringPoint.MeasuringPointCategory,
      _MeasuringPoint.MeasurementRangeUnit,
      _MeasuringPoint.Equipment,
      _MeasuringPoint.FunctionalLocation,
      _MeasuringPoint.AuthorizationGroup,

      /* Associations */
      _MeasuringPoint
}
where
  MsmtDocumentIsCancelled = ''
