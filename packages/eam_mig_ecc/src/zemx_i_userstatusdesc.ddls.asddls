// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Short and long texts of user statuses per status profile (TJ30T): the basis of the user status value map.
// Example: List all statuses of profile PM000001 to fill the map 'USER_STATUS'.
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
  key tj30t.stsma as StatusProfile,
  key tj30t.estat as StatusCode,
      @Semantics.language: true
  key tj30t.spras as Language,
      // TODO-VERIFY[L] XST-003: TJ30T field names TXT04, TXT30
      tj30t.txt04 as StatusShortName,
      @Semantics.text: true
      tj30t.txt30 as StatusName
}
