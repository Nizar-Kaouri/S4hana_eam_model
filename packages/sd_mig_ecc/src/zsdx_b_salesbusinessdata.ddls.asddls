// ModuPorter SD migration | Release 1.0.0
// Purpose: Read SalesBusinessData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZSDX_V004'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesBusinessData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZSDX_B_SalesBusinessData
  as select from vbkd as src
{
  key src.vbeln as SalesDocument,
  key src.posnr as SalesDocumentItem,
      src.bstkd as CustomerPurchaseOrder,
      src.zterm as PaymentTerms,
      src.inco1 as IncotermsClassification,
      src.inco2 as IncotermsLocation
}
