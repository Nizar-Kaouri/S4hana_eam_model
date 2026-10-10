// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CustomerSalesMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V009C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CustomerSalesMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_CustomerSalesMig
  as select from ZFIX_I_CustomerSales as src
{
  key src.Customer as Customer,
  key src.SalesOrganization as SalesOrganization,
  key src.DistributionChannel as DistributionChannel,
  key src.Division as Division,
      src.Currency as Currency,
      src.PaymentTerms as PaymentTerms,
      src.DeletionFlag as DeletionFlag
}
