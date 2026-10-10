// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Partner assignments (not deleted) with object key, partner function and partner.
// Example: The load program adds the partners to the migrated objects (filter PartnerObjectType per object).
@AbapCatalog.sqlViewName: 'ZEMX_CPA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Object partner (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_ObjectPartnerMig
  as select from ZEMX_I_ObjectPartner as src
{
      @EndUserText.label: 'Partner Object Key'
  key src.PartnerObjectKey  as PartnerObjectKey,
      @EndUserText.label: 'Partner Function'
  key src.PartnerFunction   as PartnerFunction,
      @EndUserText.label: 'Partner Counter'
  key src.PartnerCounter    as PartnerCounter,
      @EndUserText.label: 'Partner Object Type'
  key src.PartnerObjectType as PartnerObjectType,
      @EndUserText.label: 'Partner'
      src.Partner           as Partner
}
where src.IsMarkedForDeletion = ''
