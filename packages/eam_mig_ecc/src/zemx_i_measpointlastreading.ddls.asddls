// ModuPorter EAM migration | Release 1.0.0
// Purpose: Latest valid reading per measuring point: migrated as the initial reading so that counters and performance-based plans continue.
// Example: Read the last reading of every counter.
@AbapCatalog.sqlViewName: 'ZEMX_MDR'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Last reading per measuring point'
@ObjectModel.representativeKey: 'MeasuringPoint'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #COMPOSITE
define view ZEMX_I_MeasPointLastReading
  as select from ZEMX_I_MeasPointLastDoc as lastdoc
    inner join ZEMX_B_MeasurementDocument as doc on doc.MeasurementDocument = lastdoc.LastMeasurementDocument
{
      @EndUserText.label: 'Measuring Point'
  key lastdoc.MeasuringPoint        as MeasuringPoint,
      @EndUserText.label: 'Measurement Document'
      doc.MeasurementDocument       as MeasurementDocument,
      @EndUserText.label: 'Msmt Rdng Date'
      doc.MsmtRdngDate              as MsmtRdngDate,
      @EndUserText.label: 'Msmt Rdng Time'
      doc.MsmtRdngTime              as MsmtRdngTime,
      @EndUserText.label: 'Msmt Rdng By User'
      doc.MsmtRdngByUser            as MsmtRdngByUser,
      @EndUserText.label: 'Measurement Reading'
      doc.MeasurementReading        as MeasurementReading,
      @EndUserText.label: 'Measurement Counter Reading'
      doc.MeasurementCounterReading as MeasurementCounterReading,
      @EndUserText.label: 'Msmt Reading In Entry Unit'
      doc.MsmtReadingInEntryUnit    as MsmtReadingInEntryUnit,
      @EndUserText.label: 'Msmt Entry Unit'
      doc.MsmtEntryUnit             as MsmtEntryUnit,
      @EndUserText.label: 'Msmt Valuation Code'
      doc.MsmtValuationCode         as MsmtValuationCode,
      @EndUserText.label: 'Measurement Document Text'
      doc.MeasurementDocumentText   as MeasurementDocumentText
}
