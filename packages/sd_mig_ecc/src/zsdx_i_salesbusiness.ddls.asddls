// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SalesBusiness as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V004R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesBusiness'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZSDX_I_SalesBusiness
  as select from ZSDX_I_SalesBusinessData as src
{
  key src.SalesDocument as SalesDocument,
  key src.SalesDocumentItem as SalesDocumentItem,
      src.CustomerPurchaseOrder as CustomerPurchaseOrder,
      src.PaymentTerms as PaymentTerms,
      src.IncotermsClassification as IncotermsClassification,
      src.IncotermsLocation as IncotermsLocation
}
