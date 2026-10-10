// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of the partner assignments delivered by ZEMX_C_ObjectPartnerMig per PartnerObjectType, PartnerFunction; compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every PartnerObjectType / PartnerFunction combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_CPAN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Object partner count (migration)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_ObjectPartnerMigCount
  as select from ZEMX_C_ObjectPartnerMig
{
      @EndUserText.label: 'Partner Object Type'
  key PartnerObjectType as PartnerObjectType,
      @EndUserText.label: 'Partner Function'
  key PartnerFunction   as PartnerFunction,
      @EndUserText.label: 'Record Count'
      count( * )        as RecordCount
}
group by PartnerObjectType, PartnerFunction
