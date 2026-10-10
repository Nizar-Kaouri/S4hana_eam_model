// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Partner assignments (not deleted) with object key, partner function and partner (business partner) translated.
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
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'PARTNER_FUNCTION' and map01.SourceValue = src.PartnerFunction
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'EQUIPMENT' and map02.SourceValue = src.PartnerObjectKey and src.PartnerObjectType = 'IE'
    left outer join ZEMX_I_MigrationMap as map03 on map03.MapName = 'FUNCTIONAL_LOCATION' and map03.SourceValue = src.PartnerObjectKey and src.PartnerObjectType = 'IF'
    left outer join ZEMX_I_MigrationMap as map04 on map04.MapName = 'MAINTENANCE_NOTIFICATION' and map04.SourceValue = src.PartnerObjectKey and src.PartnerObjectType = 'QM'
    left outer join ZEMX_I_MigrationMap as map05 on map05.MapName = 'MAINTENANCE_ORDER' and map05.SourceValue = src.PartnerObjectKey and src.PartnerObjectType = 'OR'
    left outer join ZEMX_I_MigrationMap as map06 on map06.MapName = 'BUSINESS_PARTNER' and map06.SourceValue = src.Partner
{
  key src.PartnerObjectKey           as LegacyPartnerObjectKey,
  key src.PartnerFunction            as LegacyPartnerFunction,
  key src.PartnerCounter             as PartnerCounter,
      coalesce( map01.TargetValue, src.PartnerFunction ) as PartnerFunction,
      src.PartnerObjectType          as PartnerObjectType,
      coalesce( map02.TargetValue, coalesce( map03.TargetValue, coalesce( map04.TargetValue, coalesce( map05.TargetValue, src.PartnerObjectKey ) ) ) ) as PartnerObjectKey,
      coalesce( map06.TargetValue, src.Partner ) as Partner
}
where src.IsMarkedForDeletion = ''
