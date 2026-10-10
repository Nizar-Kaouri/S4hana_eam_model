// ZEMT EAM migration - S/4HANA reconciliation - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of measuring points on S/4HANA per MeasuringPointCategory, MeasuringPointIsCounter; same structure as the ECC count view.
// Example: Export after the load: python3 tools/mig_reconcile.py counts --module measuring_point --source <ECC export> --target <this export>.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Measuring point count (reconciliation)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.supportedCapabilities: [ #SQL_DATA_SOURCE, #EXTRACTION_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #D,
  sizeCategory: #S,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEMT_I_MeasPointCount
  as select from I_MeasuringPoint
{
  key MeasuringPointCategory  as MeasuringPointCategory,
  key MeasuringPointIsCounter as MeasuringPointIsCounter,
      count( * )              as RecordCount
}
group by MeasuringPointCategory, MeasuringPointIsCounter
