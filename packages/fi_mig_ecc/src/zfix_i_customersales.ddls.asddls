// ModuPorter FI migration | Release 1.0.0
// Purpose: Read CustomerSales as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V009R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CustomerSales'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_CustomerSales
  as select from ZFIX_B_CustomerSalesData as src
{
  key src.Customer as Customer,
  key src.SalesOrganization as SalesOrganization,
  key src.DistributionChannel as DistributionChannel,
  key src.Division as Division,
      src.Currency as Currency,
      src.PaymentTerms as PaymentTerms,
      src.DeletionFlag as DeletionFlag
}
