// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SalesFlow as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V008R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesFlow'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZSDX_I_SalesFlow
  as select from ZSDX_I_SalesFlowData as src
{
  key src.PrecedingDocument as PrecedingDocument,
  key src.PrecedingDocumentItem as PrecedingDocumentItem,
  key src.SubsequentDocument as SubsequentDocument,
  key src.SubsequentDocumentItem as SubsequentDocumentItem,
  key src.SubsequentDocumentCategory as SubsequentDocumentCategory,
      src.PrecedingDocumentCategory as PrecedingDocumentCategory,
      src.ReferencedQuantity as ReferencedQuantity
}
