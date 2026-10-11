// ModuPorter EAM migration | Release 1.0.0
// Purpose: Short and long texts of user statuses per status profile (TJ30T): reference list of the user statuses in use.
// Example: List all statuses of profile PM000001 .
@AbapCatalog.sqlViewName: 'ZEMX_TJ30T'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'User status description'
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'StatusCode'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #BASIC
define view ZEMX_I_UserStatusDesc
  as select from tj30t
{
      @EndUserText.label: 'Status Profile'
  key tj30t.stsma as StatusProfile,
      @EndUserText.label: 'Status Code'
  key tj30t.estat as StatusCode,
      @Semantics.language: true
      @EndUserText.label: 'Language'
  key tj30t.spras as Language,
      // Compatibility note: TJ30T field names TXT04, TXT30
      @EndUserText.label: 'Status Short Name'
      tj30t.txt04 as StatusShortName,
      @Semantics.text: true
      @EndUserText.label: 'Status Name'
      tj30t.txt30 as StatusName
}
