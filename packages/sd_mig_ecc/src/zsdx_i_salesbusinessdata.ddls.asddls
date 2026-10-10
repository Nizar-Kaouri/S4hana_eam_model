// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SalesBusinessData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] SDX-004: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZSDX_V004'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesBusinessData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZSDX_I_SalesBusinessData
  as select from vbkd as src
{
  key src.vbeln as SalesDocument,
  key src.posnr as SalesDocumentItem,
      src.bstkd as CustomerPurchaseOrder,
      src.zterm as PaymentTerms,
      src.inco1 as IncotermsClassification,
      src.inco2 as IncotermsLocation
}
