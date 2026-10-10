// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read QualityActivitMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V010C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'QualityActivitMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZQMX_C_QualityActivitMig
  as select from ZQMX_I_QualityActivit as src
{
  key src.QualityNotification as QualityNotification,
  key src.ActivityNumber as ActivityNumber,
      src.ActivityCodeGroup as ActivityCodeGroup,
      src.ActivityCode as ActivityCode,
      src.ActivityText as ActivityText
}
