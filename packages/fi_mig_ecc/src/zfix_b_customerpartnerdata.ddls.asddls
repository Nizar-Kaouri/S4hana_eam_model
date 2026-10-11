// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_92N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CustomerPartnerData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_B_CustomerPartnerData
  as select from knvp as src
{
  key src.kunnr as Customer,
  key src.vkorg as SalesOrganization,
  key src.vtweg as DistributionChannel,
  key src.spart as Division,
  key src.parvw as PartnerFunction,
  key src.parza as PartnerCounter,
      src.kunn2 as PartnerCustomer,
      src.lifnr as PartnerSupplier,
      src.parnr as PartnerContact,
      src.pernr as PartnerPersonnel,
      src.defpa as DefaultPartner
}
