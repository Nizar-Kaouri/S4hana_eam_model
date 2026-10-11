// ModuPorter EAM migration | Release 1.0.0
// Purpose: Measuring point on S/4HANA with the business key and the fields compared after the load; element names equal the ECC extract so that tools/mig_reconcile.py compares them by name.
// Example: Export this view after the load and compare it with the ECC extract: python3 tools/mig_reconcile.py fields --module measuring_point ...
// Compatibility note: I_MeasuringPoint elements MeasuringPointCategory and MeasuringPointIsCounter (same as packages/eam MP items)
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Measuring point compare (reconciliation)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MeasuringPoint'
@ObjectModel.supportedCapabilities: [ #SQL_DATA_SOURCE, #EXTRACTION_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #D,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEMT_B_MeasPointCompare
  as select from I_MeasuringPoint
{
  key MeasuringPoint          as MeasuringPoint,
      MeasuringPointCategory  as MeasuringPointCategory,
      MeasuringPointIsCounter as MeasuringPointIsCounter
}
