// ModuPorter MM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZMMX_96N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'MaterialEANMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_MaterialEANMig
  as select from ZMMX_I_MaterialEAN as src
{
  key src.Product as Product,
  key src.AlternativeUnit as AlternativeUnit,
  key src.EANCounter as EANCounter,
      src.EAN as EAN,
      src.EANCategory as EANCategory,
      src.MainEAN as MainEAN
}
