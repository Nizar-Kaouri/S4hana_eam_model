// ModuPorter EAM migration | Release 1.0.0
// Purpose: Classes (KLAH) by internal number.
// Example: Find the name of class 0000004711.
@AbapCatalog.sqlViewName: 'ZMMX_CL118'
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
define view ZMMX_B_ClassHeader
  as select from klah
{
      @EndUserText.label: 'Class Internal ID'
  key klah.clint as ClassInternalID,
      @EndUserText.label: 'Class Type'
      klah.klart as ClassType,
      @EndUserText.label: 'Class'
      klah.class as Class
}
