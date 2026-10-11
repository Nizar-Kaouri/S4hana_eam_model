// ModuPorter CO migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZCOX_50N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'OrderPartner'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZCOX_I_OrderPartner
  as select from ZCOX_B_ObjPartnerData as pa
    inner join ZCOX_I_InternalOrder as obj on pa.ObjectNumber = obj.ObjectNumber
{
  key obj.InternalOrder as InternalOrder,
  key pa.PartnerFunction as PartnerFunction,
  key pa.PartnerCounter as PartnerCounter,
      pa.Partner as Partner
}
where pa.PartnerDeleted = ''
