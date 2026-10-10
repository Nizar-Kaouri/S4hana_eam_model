// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ProdVersionMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V016C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProdVersionMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPPX_C_ProdVersionMig
  as select from ZPPX_I_ProdVersion as src
{
  key src.Product as Product,
  key src.Plant as Plant,
  key src.ProductionVersion as ProductionVersion,
      src.ProductionVersionText as ProductionVersionText,
      src.ValidityStartDate as ValidityStartDate,
      src.ValidityEndDate as ValidityEndDate,
      src.MinimumLotSize as MinimumLotSize,
      src.MaximumLotSize as MaximumLotSize,
      src.BOMAlternative as BOMAlternative,
      src.BOMUsage as BOMUsage,
      src.TaskListType as TaskListType,
      src.TaskListGroup as TaskListGroup,
      src.TaskListGroupCounter as TaskListGroupCounter,
      src.ProductionVersionLock as ProductionVersionLock
}
