// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_102N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierPartner'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_SupplierPartner
  as select from ZFIX_B_SupplierPartnerData as ch
    inner join ZFIX_I_SupplierPurcha as obj on ch.Supplier = obj.Supplier and ch.PurchasingOrganization = obj.PurchasingOrganization
{
  key ch.Supplier as Supplier,
  key ch.PurchasingOrganization as PurchasingOrganization,
  key ch.SupplierSubrange as SupplierSubrange,
  key ch.Plant as Plant,
  key ch.PartnerFunction as PartnerFunction,
  key ch.PartnerCounter as PartnerCounter,
      ch.PartnerSupplier as PartnerSupplier,
      ch.PartnerContact as PartnerContact,
      ch.DefaultPartner as DefaultPartner
}
