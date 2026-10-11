// ModuPorter QM migration | Release 1.0.0
// Purpose: Read QualityTask as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V009R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'QualityTask'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZQMX_I_QualityTask
  as select from ZQMX_B_QualityTaskData as src
{
  key src.QualityNotification as QualityNotification,
  key src.TaskNumber as TaskNumber,
      src.TaskCodeGroup as TaskCodeGroup,
      src.TaskCode as TaskCode,
      src.TaskText as TaskText
}
