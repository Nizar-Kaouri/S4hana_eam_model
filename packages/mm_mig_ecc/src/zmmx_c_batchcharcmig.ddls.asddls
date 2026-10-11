// ModuPorter MM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZMMX_134N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'BatchCharcMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_BatchCharcMig
  as select from ZMMX_I_BatchCharc as src
{
  key src.ClassifiedObject as ClassifiedObject,
  key src.ClassType as ClassType,
  key src.Characteristic as Characteristic,
  key src.CharcValuePositionNumber as CharcValuePositionNumber,
      src.CharcValue as CharcValue,
      src.CharcFromNumericValue as CharcFromNumericValue,
      src.CharcToNumericValue as CharcToNumericValue,
      src.CharcValueDependency as CharcValueDependency
}
