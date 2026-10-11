// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_94N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'CustomerPartnerMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_CustomerPartnerMig
  as select from ZFIX_I_CustomerPartner as src
{
  key src.Customer as Customer,
  key src.SalesOrganization as SalesOrganization,
  key src.DistributionChannel as DistributionChannel,
  key src.Division as Division,
  key src.PartnerFunction as PartnerFunction,
  key src.PartnerCounter as PartnerCounter,
      src.PartnerCustomer as PartnerCustomer,
      src.PartnerSupplier as PartnerSupplier,
      src.PartnerContact as PartnerContact,
      src.PartnerPersonnel as PartnerPersonnel,
      src.DefaultPartner as DefaultPartner
}
