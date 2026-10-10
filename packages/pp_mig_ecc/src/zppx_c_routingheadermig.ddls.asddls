// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read RoutingHeaderMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V011C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'RoutingHeaderMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPPX_C_RoutingHeaderMig
  as select from ZPPX_I_RoutingHeader as src
{
  key src.TaskListType as TaskListType,
  key src.TaskListGroup as TaskListGroup,
  key src.TaskListGroupCounter as TaskListGroupCounter,
  key src.InternalCounter as InternalCounter,
      src.ValidFromDate as ValidFromDate,
      src.ChangeNumber as ChangeNumber,
      src.DeletionFlag as DeletionFlag,
      src.TaskListDescription as TaskListDescription
}
