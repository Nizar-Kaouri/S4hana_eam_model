// ModuPorter EAM migration | Release 1.0.0
// Purpose: Latest non-cancelled reading by date and time; highest document ID breaks timestamp ties.
// Example: Read LastMeasurementDocument of measuring point 1234.
@AbapCatalog.sqlViewName: 'ZEMX_MDL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Last measurement document per point'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #COMPOSITE
define view ZEMX_I_MeasPointLastDoc
  as select from ZEMX_B_MeasurementDocument as doc
    inner join ZEMX_I_MeasPointLastTime as latest
      on latest.MeasuringPoint = doc.MeasuringPoint
      and latest.LastReadingDate = doc.MsmtRdngDate
      and latest.LastReadingTime = doc.MsmtRdngTime
{
      @EndUserText.label: 'Measuring Point'
  key doc.MeasuringPoint             as MeasuringPoint,
      @EndUserText.label: 'Last Measurement Document'
      max( doc.MeasurementDocument ) as LastMeasurementDocument
}
where doc.MsmtDocumentIsCancelled = ''
group by doc.MeasuringPoint
