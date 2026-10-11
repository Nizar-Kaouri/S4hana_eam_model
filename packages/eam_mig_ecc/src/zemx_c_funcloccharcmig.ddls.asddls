// ModuPorter EAM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZEMX_197N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'FuncLocCharcMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_FuncLocCharcMig
  as select from ZEMX_I_FuncLocCharc as src
{
  key src.FunctionalLocation as FunctionalLocation,
  key src.ClassType as ClassType,
  key src.Characteristic as Characteristic,
  key src.CharcValuePositionNumber as CharcValuePositionNumber,
      src.CharcValue as CharcValue,
      src.CharcFromNumericValue as CharcFromNumericValue,
      src.CharcToNumericValue as CharcToNumericValue,
      src.CharcValueDependency as CharcValueDependency
}
