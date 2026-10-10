// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of measurement documents per MsmtDocumentIsCancelled on the ECC source; compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool reports every MsmtDocumentIsCancelled / MsmtDocumentIsCancelled combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_MDC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Measurement document count (reconciliation)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #COMPOSITE
define view ZEMX_R_MeasDocCount
  as select from ZEMX_I_MeasurementDocument
{
  key MsmtDocumentIsCancelled as MsmtDocumentIsCancelled,
      count( * )              as RecordCount
}
group by MsmtDocumentIsCancelled
