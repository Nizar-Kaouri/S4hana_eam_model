// ModuPorter PP migration | Release 1.0.0
// Purpose: Read ProdVersion as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V016R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProdVersion'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPPX_I_ProdVersion
  as select from ZPPX_B_ProdVersionData as src
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
