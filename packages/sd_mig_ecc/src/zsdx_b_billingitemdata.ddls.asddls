// ModuPorter SD migration | Release 1.0.0
// Purpose: Read BillingItemData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZSDX_V012'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BillingItemData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZSDX_B_BillingItemData
  as select from vbrp as src
{
  key src.vbeln as BillingDocument,
  key src.posnr as BillingDocumentItem,
      src.matnr as Material,
      src.fkimg as BillingQuantity,
      src.vrkme as SalesUnit,
      src.netwr as NetAmount,
      src.vgbel as ReferenceDocument,
      src.vgpos as ReferenceDocumentItem,
      src.arktx as ItemShortText
}
