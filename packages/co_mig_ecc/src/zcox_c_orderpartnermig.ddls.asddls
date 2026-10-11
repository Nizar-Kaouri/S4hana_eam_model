// ModuPorter CO migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZCOX_51N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'OrderPartnerMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZCOX_C_OrderPartnerMig
  as select from ZCOX_I_OrderPartner as src
{
  key src.InternalOrder as InternalOrder,
  key src.PartnerFunction as PartnerFunction,
  key src.PartnerCounter as PartnerCounter,
      src.Partner as Partner
}
