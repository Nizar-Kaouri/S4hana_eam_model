// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Active user statuses (kind E) with object key and status profile; system statuses are set by S/4HANA and not migrated.
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
{
      @EndUserText.label: 'Status Object Key'
  key src.StatusObjectKey  as StatusObjectKey,
      @EndUserText.label: 'Status Code'
  key src.StatusCode       as StatusCode,
      @EndUserText.label: 'Status Object Type'
      src.StatusObjectType as StatusObjectType,
      @EndUserText.label: 'Status Profile'
      src.StatusProfile    as StatusProfile
}
where src.StatusKind = 'E'
