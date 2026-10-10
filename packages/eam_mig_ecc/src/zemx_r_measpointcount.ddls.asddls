// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of measuring points per MeasuringPointCategory, MeasuringPointIsCounter on the ECC source (migration scope only); compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool reports every MeasuringPointCategory / MeasuringPointIsCounter combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_MPC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Measuring point count (reconciliation)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #COMPOSITE
define view ZEMX_R_MeasPointCount
  as select from ZEMX_I_MeasuringPoint
{
  key MeasuringPointCategory  as MeasuringPointCategory,
  key MeasuringPointIsCounter as MeasuringPointIsCounter,
      count( * )              as RecordCount
}
where IsMarkedForDeletion = ''
group by MeasuringPointCategory, MeasuringPointIsCounter
