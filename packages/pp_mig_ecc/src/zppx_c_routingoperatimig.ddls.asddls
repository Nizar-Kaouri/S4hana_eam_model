// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read RoutingOperatiMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V014C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'RoutingOperatiMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPPX_C_RoutingOperatiMig
  as select from ZPPX_I_RoutingOperati as src
{
  key src.TaskListType as TaskListType,
  key src.TaskListGroup as TaskListGroup,
  key src.TaskListNode as TaskListNode,
  key src.InternalCounter as InternalCounter,
      src.ValidFromDate as ValidFromDate,
      src.ChangeNumber as ChangeNumber,
      src.DeletionFlag as DeletionFlag,
      src.Operation as Operation,
      src.OperationText as OperationText
}
