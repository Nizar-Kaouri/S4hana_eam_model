// ModuPorter FI migration | Release 1.0.0
// Purpose: Read CustomerSalesData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFIX_V009'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CustomerSalesData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_I_CustomerSalesData
  as select from knvv as src
{
  key src.kunnr as Customer,
  key src.vkorg as SalesOrganization,
  key src.vtweg as DistributionChannel,
  key src.spart as Division,
      src.waers as Currency,
      src.zterm as PaymentTerms,
      src.loevm as DeletionFlag
}
