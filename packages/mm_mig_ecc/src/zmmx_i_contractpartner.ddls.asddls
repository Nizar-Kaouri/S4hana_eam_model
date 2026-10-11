// ModuPorter MM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZMMX_101N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ContractPartner'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_ContractPartner
  as select from ZMMX_B_ContractPartnerData as ch
    inner join ZMMX_I_ContractHeader as obj on ch.PurchasingContract = obj.PurchasingContract
{
  key ch.PurchasingContract as PurchasingContract,
  key ch.PurchasingOrganization as PurchasingOrganization,
  key ch.SupplierSubrange as SupplierSubrange,
  key ch.Plant as Plant,
  key ch.PartnerFunction as PartnerFunction,
  key ch.PartnerCounter as PartnerCounter,
      ch.PartnerSupplier as PartnerSupplier,
      ch.PartnerContact as PartnerContact,
      ch.DefaultPartner as DefaultPartner
}
