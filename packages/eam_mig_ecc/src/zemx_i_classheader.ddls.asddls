// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Classes (KLAH) by internal number.
// Example: Find the name of class 0000004711.
@AbapCatalog.sqlViewName: 'ZEMX_KLAH'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Class header'
@ObjectModel.representativeKey: 'ClassInternalID'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #BASIC
define view ZEMX_I_ClassHeader
  as select from klah
{
  key klah.clint as ClassInternalID,
      klah.klart as ClassType,
      klah.class as Class
}
