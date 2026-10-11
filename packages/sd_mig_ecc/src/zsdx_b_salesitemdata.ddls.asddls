// ModuPorter SD migration | Release 1.0.0
// Purpose: Read SalesItemData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZSDX_V002'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesItemData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZSDX_B_SalesItemData
  as select from vbap as src
{
  key src.vbeln as SalesDocument,
  key src.posnr as SalesDocumentItem,
      src.matnr as Material,
      src.werks as Plant,
      src.kwmeng as OrderQuantity,
      src.vrkme as SalesUnit,
      src.abgru as RejectionReason
}
