// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Latest non-cancelled reading timestamp helper.
// Example: Read LastMeasurementDocument of measuring point 1234.
@AbapCatalog.sqlViewName: 'ZEMX_MDD'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Last reading date'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #COMPOSITE
define view ZEMX_I_MeasPointLastDate
  as select from ZEMX_I_MeasurementDocument as doc
{
      @EndUserText.label: 'Measuring point'
  key doc.MeasuringPoint as MeasuringPoint,
      @EndUserText.label: 'Latest reading date'
      max( doc.MsmtRdngDate ) as LastReadingDate
}
where doc.MsmtDocumentIsCancelled = ''
group by doc.MeasuringPoint
