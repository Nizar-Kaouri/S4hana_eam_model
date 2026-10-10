// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of long texts per TextObject, TextID on the ECC source; compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool reports every TextObject / TextID combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_LTC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Long text count (reconciliation)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #COMPOSITE
define view ZEMX_R_LongTextCount
  as select from ZEMX_I_LongTextHeader
{
  key TextObject as TextObject,
  key TextID     as TextID,
      count( * ) as RecordCount
}
group by TextObject, TextID
