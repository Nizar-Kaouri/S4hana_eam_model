// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PlanCharacteriMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V015C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PlanCharacteriMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZQMX_C_PlanCharacteriMig
  as select from ZQMX_I_PlanCharacteri as src
{
  key src.TaskListType as TaskListType,
  key src.TaskListGroup as TaskListGroup,
  key src.TaskListNode as TaskListNode,
  key src.CharacteristicNumber as CharacteristicNumber,
  key src.InternalCounter as InternalCounter,
      src.ValidFromDate as ValidFromDate,
      src.DeletionFlag as DeletionFlag,
      src.CharacteristicDescription as CharacteristicDescription
}
