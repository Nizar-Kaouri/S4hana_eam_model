// ModuPorter SD migration | Release 1.0.0
// Purpose: Read SalesOrderMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V001C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesOrderMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZSDX_C_SalesOrderMig
  as select from ZSDX_I_SalesOrder as src
{
  key src.SalesDocument as SalesDocument,
      src.SalesDocumentType as SalesDocumentType,
      src.SalesOrganization as SalesOrganization,
      src.DistributionChannel as DistributionChannel,
      src.Division as Division,
      src.SoldToParty as SoldToParty,
      src.TransactionCurrency as TransactionCurrency
}
