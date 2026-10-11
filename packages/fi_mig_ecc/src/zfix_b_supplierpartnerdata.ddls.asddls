// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_101N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierPartnerData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_B_SupplierPartnerData
  as select from wyt3 as src
{
  key src.lifnr as Supplier,
  key src.ekorg as PurchasingOrganization,
  key src.ltsnr as SupplierSubrange,
  key src.werks as Plant,
  key src.parvw as PartnerFunction,
  key src.parza as PartnerCounter,
      src.lifn2 as PartnerSupplier,
      src.parnr as PartnerContact,
      src.defpa as DefaultPartner
}
