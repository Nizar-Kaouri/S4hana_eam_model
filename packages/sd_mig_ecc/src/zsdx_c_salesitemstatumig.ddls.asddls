// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SalesItemStatuMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V007C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesItemStatuMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZSDX_C_SalesItemStatuMig
  as select from ZSDX_I_SalesItemStatu as src
{
  key src.SalesDocument as SalesDocument,
  key src.SalesDocumentItem as SalesDocumentItem,
      src.OverallProcessingStatus as OverallProcessingStatus,
      src.DeliveryStatus as DeliveryStatus,
      src.BillingStatus as BillingStatus
}
