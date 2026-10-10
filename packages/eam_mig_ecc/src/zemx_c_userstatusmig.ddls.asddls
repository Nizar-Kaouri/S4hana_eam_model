// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Active user statuses (kind E) with object key, status profile and status translated; system statuses are set by S/4HANA and not migrated.
// Example: The load program sets the user statuses after the objects are loaded (filter StatusObjectType per object).
@AbapCatalog.sqlViewName: 'ZEMX_CST'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'User status (migration)'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_UserStatusMig
  as select from ZEMX_I_ObjectStatus as src
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'USER_STATUS' and map01.SourceValue = src.StatusCode
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'EQUIPMENT' and map02.SourceValue = src.StatusObjectKey and src.StatusObjectType = 'IE'
    left outer join ZEMX_I_MigrationMap as map03 on map03.MapName = 'FUNCTIONAL_LOCATION' and map03.SourceValue = src.StatusObjectKey and src.StatusObjectType = 'IF'
    left outer join ZEMX_I_MigrationMap as map04 on map04.MapName = 'MAINTENANCE_NOTIFICATION' and map04.SourceValue = src.StatusObjectKey and src.StatusObjectType = 'QM'
    left outer join ZEMX_I_MigrationMap as map05 on map05.MapName = 'MAINTENANCE_ORDER' and map05.SourceValue = src.StatusObjectKey and src.StatusObjectType = 'OR'
    left outer join ZEMX_I_MigrationMap as map06 on map06.MapName = 'STATUS_PROFILE' and map06.SourceValue = src.StatusProfile
{
  key src.StatusObjectKey            as LegacyStatusObjectKey,
  key src.StatusCode                 as LegacyStatusCode,
      coalesce( map01.TargetValue, src.StatusCode ) as StatusCode,
      src.StatusObjectType           as StatusObjectType,
      coalesce( map02.TargetValue, coalesce( map03.TargetValue, coalesce( map04.TargetValue, coalesce( map05.TargetValue, src.StatusObjectKey ) ) ) ) as StatusObjectKey,
      coalesce( map06.TargetValue, src.StatusProfile ) as StatusProfile
}
where src.StatusKind = 'E'
