// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Latest non-cancelled reading timestamp helper.
// Example: Read LastMeasurementDocument of measuring point 1234.
@AbapCatalog.sqlViewName: 'ZEMX_MDT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Last reading time'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #COMPOSITE
define view ZEMX_I_MeasPointLastTime
  as select from ZEMX_I_MeasurementDocument as doc
    inner join ZEMX_I_MeasPointLastDate as latest
      on latest.MeasuringPoint = doc.MeasuringPoint and latest.LastReadingDate = doc.MsmtRdngDate
{
      @EndUserText.label: 'Measuring point'
  key doc.MeasuringPoint as MeasuringPoint,
      @EndUserText.label: 'Latest reading date'
      doc.MsmtRdngDate as LastReadingDate,
      @EndUserText.label: 'Latest reading time'
      max( doc.MsmtRdngTime ) as LastReadingTime
}
where doc.MsmtDocumentIsCancelled = ''
group by doc.MeasuringPoint, doc.MsmtRdngDate
