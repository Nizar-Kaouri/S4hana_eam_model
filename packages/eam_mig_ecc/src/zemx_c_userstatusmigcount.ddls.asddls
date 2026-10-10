// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of the user statuses delivered by ZEMX_C_UserStatusMig per StatusObjectType, StatusCode; compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every StatusObjectType / StatusCode combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_CSTN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'User status count (migration)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_UserStatusMigCount
  as select from ZEMX_C_UserStatusMig
{
      @EndUserText.label: 'Status Object Type'
  key StatusObjectType as StatusObjectType,
      @EndUserText.label: 'Status Code'
  key StatusCode       as StatusCode,
      @EndUserText.label: 'Record Count'
      count( * )       as RecordCount
}
group by StatusObjectType, StatusCode
