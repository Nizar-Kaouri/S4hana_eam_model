// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read RoutingMateria as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V012R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'RoutingMateria'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPPX_I_RoutingMateria
  as select from ZPPX_I_RoutingMateriaData as src
{
  key src.Material as Material,
  key src.Plant as Plant,
  key src.TaskListType as TaskListType,
  key src.TaskListGroup as TaskListGroup,
  key src.TaskListGroupCounter as TaskListGroupCounter,
  key src.InternalCounter as InternalCounter,
      src.ValidFromDate as ValidFromDate,
      src.DeletionFlag as DeletionFlag
}
