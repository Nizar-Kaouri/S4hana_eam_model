// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of the last readings delivered by ZEMX_C_MeasReadingMig per MsmtEntryUnit; compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every MsmtEntryUnit / MsmtEntryUnit combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_CMRN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Last reading count (migration)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MeasReadingMigCount
  as select from ZEMX_C_MeasReadingMig
{
  key MsmtEntryUnit as MsmtEntryUnit,
      count( * )    as RecordCount
}
group by MsmtEntryUnit
