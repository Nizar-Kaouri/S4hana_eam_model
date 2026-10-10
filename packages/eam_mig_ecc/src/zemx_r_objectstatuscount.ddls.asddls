// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of active statuses per StatusObjectType, StatusCode on the ECC source; compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool reports every StatusObjectType / StatusCode combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_STC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Object status count (reconciliation)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #COMPOSITE
define view ZEMX_R_ObjectStatusCount
  as select from ZEMX_I_ObjectStatus
{
  key StatusObjectType as StatusObjectType,
  key StatusCode       as StatusCode,
      count( * )       as RecordCount
}
group by StatusObjectType, StatusCode
