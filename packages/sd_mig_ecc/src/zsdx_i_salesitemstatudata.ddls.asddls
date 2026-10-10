// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SalesItemStatuData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] SDX-007: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZSDX_V007'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesItemStatuData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZSDX_I_SalesItemStatuData
  as select from vbup as src
{
  key src.vbeln as SalesDocument,
  key src.posnr as SalesDocumentItem,
      src.gbsta as OverallProcessingStatus,
      src.lfsta as DeliveryStatus,
      src.fksta as BillingStatus
}
