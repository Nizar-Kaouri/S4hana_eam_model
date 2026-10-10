// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SalesFlowData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] SDX-008: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZSDX_V008'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesFlowData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZSDX_I_SalesFlowData
  as select from vbfa as src
{
  key src.vbelv as PrecedingDocument,
  key src.posnv as PrecedingDocumentItem,
  key src.vbeln as SubsequentDocument,
  key src.posnn as SubsequentDocumentItem,
  key src.vbtyp_n as SubsequentDocumentCategory,
      src.vbtyp_v as PrecedingDocumentCategory,
      src.rfmng as ReferencedQuantity
}
