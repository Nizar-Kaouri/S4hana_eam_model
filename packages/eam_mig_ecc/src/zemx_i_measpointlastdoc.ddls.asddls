// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Highest non-cancelled measurement document number per measuring point (helper for the last reading).
// Example: Read LastMeasurementDocument of measuring point 1234.
// TODO-VERIFY[H] XMD-002: measurement document numbers ascend with time (internal number range), so the highest number is the latest reading
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
  as select from ZEMX_I_MeasurementDocument as doc
{
      @EndUserText.label: 'Measuring Point'
  key doc.MeasuringPoint             as MeasuringPoint,
      @EndUserText.label: 'Last Measurement Document'
      max( doc.MeasurementDocument ) as LastMeasurementDocument
}
where doc.MsmtDocumentIsCancelled = ''
group by doc.MeasuringPoint
