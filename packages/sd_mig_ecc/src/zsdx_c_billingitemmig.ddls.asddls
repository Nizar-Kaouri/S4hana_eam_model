// ModuPorter SD migration | Release 1.0.0
// Purpose: Read BillingItemMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V012C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BillingItemMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZSDX_C_BillingItemMig
  as select from ZSDX_I_BillingItem as src
{
  key src.BillingDocument as BillingDocument,
  key src.BillingDocumentItem as BillingDocumentItem,
      src.Material as Material,
      src.BillingQuantity as BillingQuantity,
      src.SalesUnit as SalesUnit,
      src.NetAmount as NetAmount,
      src.ReferenceDocument as ReferenceDocument,
      src.ReferenceDocumentItem as ReferenceDocumentItem,
      src.ItemShortText as ItemShortText
}
