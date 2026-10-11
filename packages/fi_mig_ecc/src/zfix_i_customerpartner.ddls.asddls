// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_93N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CustomerPartner'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_CustomerPartner
  as select from ZFIX_B_CustomerPartnerData as ch
    inner join ZFIX_I_CustomerSales as obj on ch.Customer = obj.Customer and ch.SalesOrganization = obj.SalesOrganization and ch.DistributionChannel = obj.DistributionChannel and ch.Division = obj.Division
{
  key ch.Customer as Customer,
  key ch.SalesOrganization as SalesOrganization,
  key ch.DistributionChannel as DistributionChannel,
  key ch.Division as Division,
  key ch.PartnerFunction as PartnerFunction,
  key ch.PartnerCounter as PartnerCounter,
      ch.PartnerCustomer as PartnerCustomer,
      ch.PartnerSupplier as PartnerSupplier,
      ch.PartnerContact as PartnerContact,
      ch.PartnerPersonnel as PartnerPersonnel,
      ch.DefaultPartner as DefaultPartner
}
