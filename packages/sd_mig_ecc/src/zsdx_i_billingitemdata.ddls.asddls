// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read BillingItemData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] SDX-012: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZSDX_V012'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BillingItemData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZSDX_I_BillingItemData
  as select from vbrp as src
{
  key src.vbeln as BillingDocument,
  key src.posnr as BillingDocumentItem,
      src.matnr as Material,
      src.fkimg as BillingQuantity,
      src.vrkme as SalesUnit,
      src.netwr as NetAmount,
      src.vgbel as ReferenceDocument,
      src.vgpos as ReferenceDocumentItem
}
