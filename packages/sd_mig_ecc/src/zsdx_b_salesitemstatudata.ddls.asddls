// ModuPorter SD migration | Release 1.0.0
// Purpose: Read SalesItemStatuData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZSDX_V007'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesItemStatuData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZSDX_B_SalesItemStatuData
  as select from vbup as src
{
  key src.vbeln as SalesDocument,
  key src.posnr as SalesDocumentItem,
      src.gbsta as OverallProcessingStatus,
      src.lfsta as DeliveryStatus,
      src.fksta as BillingStatus
}
