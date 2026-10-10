// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
    inner join ZEMX_I_MeasurementDocument as doc on doc.MeasurementDocument = lastdoc.LastMeasurementDocument
{
  key lastdoc.MeasuringPoint        as MeasuringPoint,
      doc.MeasurementDocument       as MeasurementDocument,
      doc.MsmtRdngDate              as MsmtRdngDate,
      doc.MsmtRdngTime              as MsmtRdngTime,
      doc.MsmtRdngByUser            as MsmtRdngByUser,
      doc.MeasurementReading        as MeasurementReading,
      doc.MeasurementCounterReading as MeasurementCounterReading,
      doc.MsmtReadingInEntryUnit    as MsmtReadingInEntryUnit,
      doc.MsmtEntryUnit             as MsmtEntryUnit,
      doc.MsmtValuationCode         as MsmtValuationCode,
      doc.MeasurementDocumentText   as MeasurementDocumentText
}
