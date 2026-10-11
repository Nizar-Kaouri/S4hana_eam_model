// ModuPorter MM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZMMX_131N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialCharc'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_MaterialCharc
  as select from ZMMX_I_CharcValue as src
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
where src.ClassType = '001'
