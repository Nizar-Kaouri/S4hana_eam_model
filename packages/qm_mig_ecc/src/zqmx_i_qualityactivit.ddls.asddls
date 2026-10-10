// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read QualityActivit as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V010R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'QualityActivit'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZQMX_I_QualityActivit
  as select from ZQMX_I_QualityActivitData as src
{
  key src.QualityNotification as QualityNotification,
  key src.ActivityNumber as ActivityNumber,
      src.ActivityCodeGroup as ActivityCodeGroup,
      src.ActivityCode as ActivityCode,
      src.ActivityText as ActivityText
}
