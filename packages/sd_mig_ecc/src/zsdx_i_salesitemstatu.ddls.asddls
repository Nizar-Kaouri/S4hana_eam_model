// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SalesItemStatu as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V007R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesItemStatu'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZSDX_I_SalesItemStatu
  as select from ZSDX_I_SalesItemStatuData as src
{
  key src.SalesDocument as SalesDocument,
  key src.SalesDocumentItem as SalesDocumentItem,
      src.OverallProcessingStatus as OverallProcessingStatus,
      src.DeliveryStatus as DeliveryStatus,
      src.BillingStatus as BillingStatus
}
