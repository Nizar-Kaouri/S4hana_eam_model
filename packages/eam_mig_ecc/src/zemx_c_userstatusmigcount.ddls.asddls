// ModuPorter EAM migration | Release 1.0.0
// Purpose: Record count of the user statuses delivered by ZEMX_C_UserStatusMig per StatusObjectType, StatusCode.
// Example: Export this source count view to record the selected extraction population by its dimensions.
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
