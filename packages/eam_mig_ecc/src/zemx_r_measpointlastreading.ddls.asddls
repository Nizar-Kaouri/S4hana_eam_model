// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Latest valid reading per measuring point: the default migration scope (initial counter readings so that performance-based maintenance plans continue).
// Example: Extract all rows and load them as the first measurement document of each counter on S/4HANA.
@AbapCatalog.sqlViewName: 'ZEMX_MDR'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Last reading per measuring point'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #COMPOSITE
define view ZEMX_R_MeasPointLastReading
  as select from ZEMX_R_MeasPointLastDoc as lastdoc
    inner join ZEMX_I_MeasurementDocument as doc on doc.MeasurementDocument = lastdoc.LastMeasurementDocument
{
  key lastdoc.MeasuringPoint        as MeasuringPoint,
      doc.MeasurementDocument       as MeasurementDocument,
      doc.MsmtRdngDate              as MsmtRdngDate,
      doc.MsmtRdngTime              as MsmtRdngTime,
      doc.MeasurementReading        as MeasurementReading,
      doc.MeasurementCounterReading as MeasurementCounterReading,
      doc.MsmtReadingInEntryUnit    as MsmtReadingInEntryUnit,
      doc.MsmtEntryUnit             as MsmtEntryUnit
}
