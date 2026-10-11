// ModuPorter MM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZMMX_99N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'PurchasePartnerMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_PurchasePartnerMig
  as select from ZMMX_I_PurchasePartner as src
{
  key src.PurchaseOrder as PurchaseOrder,
  key src.PurchasingOrganization as PurchasingOrganization,
  key src.SupplierSubrange as SupplierSubrange,
  key src.Plant as Plant,
  key src.PartnerFunction as PartnerFunction,
  key src.PartnerCounter as PartnerCounter,
      src.PartnerSupplier as PartnerSupplier,
      src.PartnerContact as PartnerContact,
      src.DefaultPartner as DefaultPartner
}
