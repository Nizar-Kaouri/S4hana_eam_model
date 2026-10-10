// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of the long texts delivered by ZEMX_C_LongTextIndexMig per TextObject, TextID (values already translated); compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every TextObject / TextID combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_CLTN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Long text count (migration)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_LongTextMigCount
  as select from ZEMX_C_LongTextIndexMig
{
  key TextObject as TextObject,
  key TextID     as TextID,
      count( * ) as RecordCount
}
group by TextObject, TextID
