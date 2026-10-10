// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Highest non-cancelled measurement document number per measuring point (helper for the last reading).
// Example: Read LastMeasurementDocument for measuring point 1234 to see which reading becomes the initial counter reading on S/4HANA.
// TODO-VERIFY[H] XMD-002: measurement document numbers ascend with time (internal number range), so the highest number is the latest reading
@AbapCatalog.sqlViewName: 'ZEMX_MDL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Last measurement document per point'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #COMPOSITE
define view ZEMX_R_MeasPointLastDoc
  as select from ZEMX_I_MeasurementDocument
{
  key MeasuringPoint             as MeasuringPoint,
      max( MeasurementDocument ) as LastMeasurementDocument
}
where MsmtDocumentIsCancelled = ''
group by MeasuringPoint
