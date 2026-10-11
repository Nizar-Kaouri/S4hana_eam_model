// ModuPorter SD migration | Release 1.0.0
// Purpose: Read SalesFlowMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V008C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesFlowMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZSDX_C_SalesFlowMig
  as select from ZSDX_I_SalesFlow as src
{
  key src.PrecedingDocument as PrecedingDocument,
  key src.PrecedingDocumentItem as PrecedingDocumentItem,
  key src.SubsequentDocument as SubsequentDocument,
  key src.SubsequentDocumentItem as SubsequentDocumentItem,
  key src.SubsequentDocumentCategory as SubsequentDocumentCategory,
      src.PrecedingDocumentCategory as PrecedingDocumentCategory,
      src.ReferencedQuantity as ReferencedQuantity
}
