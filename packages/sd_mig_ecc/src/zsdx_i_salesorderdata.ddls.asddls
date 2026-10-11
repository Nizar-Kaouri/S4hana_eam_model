// ModuPorter SD migration | Release 1.0.0
// Purpose: Read SalesOrderData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZSDX_V001'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesOrderData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZSDX_I_SalesOrderData
  as select from vbak as src
{
  key src.vbeln as SalesDocument,
      src.auart as SalesDocumentType,
      src.vkorg as SalesOrganization,
      src.vtweg as DistributionChannel,
      src.spart as Division,
      src.kunnr as SoldToParty,
      src.waerk as TransactionCurrency
}
