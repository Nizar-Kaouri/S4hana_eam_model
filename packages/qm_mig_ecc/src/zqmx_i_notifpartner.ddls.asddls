// ModuPorter QM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZQMX_67N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NotifPartner'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZQMX_I_NotifPartner
  as select from ZQMX_B_ObjPartnerData as pa
    inner join ZQMX_I_QualityNotific as obj on pa.ObjectNumber = obj.ObjectNumber
{
  key obj.QualityNotification as QualityNotification,
  key pa.PartnerFunction as PartnerFunction,
  key pa.PartnerCounter as PartnerCounter,
      pa.Partner as Partner
}
where pa.PartnerDeleted = ''
