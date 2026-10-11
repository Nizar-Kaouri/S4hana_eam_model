// ModuPorter EAM migration | Release 1.0.0
// Purpose: Last valid reading per measuring point; values in the SI unit.
// Example: The load program posts one measurement document per row as the initial reading on S/4HANA.
@AbapCatalog.sqlViewName: 'ZEMX_CMR'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Last measurement reading (migration)'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MeasReadingMig
  as select from ZEMX_I_MeasPointLastReading as src
{
      @EndUserText.label: 'Measuring Point'
  key src.MeasuringPoint            as MeasuringPoint,
      @EndUserText.label: 'Msmt Rdng Date'
      src.MsmtRdngDate              as MsmtRdngDate,
      @EndUserText.label: 'Msmt Rdng Time'
      src.MsmtRdngTime              as MsmtRdngTime,
      @EndUserText.label: 'Msmt Rdng By User'
      src.MsmtRdngByUser            as MsmtRdngByUser,
      @EndUserText.label: 'Measurement Reading'
      src.MeasurementReading        as MeasurementReading,
      @EndUserText.label: 'Measurement Counter Reading'
      src.MeasurementCounterReading as MeasurementCounterReading,
      @EndUserText.label: 'Msmt Reading In Entry Unit'
      src.MsmtReadingInEntryUnit    as MsmtReadingInEntryUnit,
      @EndUserText.label: 'Msmt Entry Unit'
      src.MsmtEntryUnit             as MsmtEntryUnit,
      @EndUserText.label: 'Msmt Valuation Code'
      src.MsmtValuationCode         as MsmtValuationCode,
      @EndUserText.label: 'Measurement Document Text'
      src.MeasurementDocumentText   as MeasurementDocumentText
}
