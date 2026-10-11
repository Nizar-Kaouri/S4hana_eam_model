// ModuPorter MM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZMMX_95N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialEAN'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_MaterialEAN
  as select from ZMMX_B_MaterialEANData as ch
    inner join ZMMX_I_MaterialUnit as obj on ch.Product = obj.Product and ch.AlternativeUnit = obj.AlternativeUnit
{
  key ch.Product as Product,
  key ch.AlternativeUnit as AlternativeUnit,
  key ch.EANCounter as EANCounter,
      ch.EAN as EAN,
      ch.EANCategory as EANCategory,
      ch.MainEAN as MainEAN
}
