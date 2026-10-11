// ModuPorter SD migration | Release 1.0.0
// Purpose: Read BillingItem as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V012R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BillingItem'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZSDX_I_BillingItem
  as select from ZSDX_B_BillingItemData as src
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
