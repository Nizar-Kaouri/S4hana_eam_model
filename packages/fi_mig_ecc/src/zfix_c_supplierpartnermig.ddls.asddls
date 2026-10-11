// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_103N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'SupplierPartnerMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_SupplierPartnerMig
  as select from ZFIX_I_SupplierPartner as src
{
  key src.Supplier as Supplier,
  key src.PurchasingOrganization as PurchasingOrganization,
  key src.SupplierSubrange as SupplierSubrange,
  key src.Plant as Plant,
  key src.PartnerFunction as PartnerFunction,
  key src.PartnerCounter as PartnerCounter,
      src.PartnerSupplier as PartnerSupplier,
      src.PartnerContact as PartnerContact,
      src.DefaultPartner as DefaultPartner
}
