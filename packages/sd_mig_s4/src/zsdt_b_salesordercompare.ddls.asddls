// ModuPorter SD migration | Release 1.0.0
// Purpose: Read SalesOrderCompare as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesOrderCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZSDT_B_SalesOrderCompare
  as select from I_SalesDocument as src
{
  key src.SalesDocument as SalesDocument,
      src.SalesDocumentType as SalesDocumentType,
      src.SalesOrganization as SalesOrganization,
      src.DistributionChannel as DistributionChannel,
      src.Division as Division,
      src.SoldToParty as SoldToParty,
      src.TransactionCurrency as TransactionCurrency
}
