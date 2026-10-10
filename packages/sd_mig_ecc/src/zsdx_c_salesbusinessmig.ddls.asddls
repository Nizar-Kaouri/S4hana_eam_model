// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SalesBusinessMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V004C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesBusinessMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZSDX_C_SalesBusinessMig
  as select from ZSDX_I_SalesBusiness as src
{
  key src.SalesDocument as SalesDocument,
  key src.SalesDocumentItem as SalesDocumentItem,
      src.CustomerPurchaseOrder as CustomerPurchaseOrder,
      src.PaymentTerms as PaymentTerms,
      src.IncotermsClassification as IncotermsClassification,
      src.IncotermsLocation as IncotermsLocation
}
