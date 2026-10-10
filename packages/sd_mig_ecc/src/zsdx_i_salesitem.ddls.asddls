// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SalesItem as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V002R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesItem'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZSDX_I_SalesItem
  as select from ZSDX_I_SalesItemData as src
{
  key src.SalesDocument as SalesDocument,
  key src.SalesDocumentItem as SalesDocumentItem,
      src.Material as Material,
      src.Plant as Plant,
      src.OrderQuantity as OrderQuantity,
      src.SalesUnit as SalesUnit,
      src.RejectionReason as RejectionReason
}
