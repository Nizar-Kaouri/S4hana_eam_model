// ModuPorter SD migration | Release 1.0.0
// Purpose: Read SalesHeaderSta as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V006R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesHeaderSta'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZSDX_I_SalesHeaderSta
  as select from ZSDX_I_SalesHeaderStaData as src
{
  key src.SalesDocument as SalesDocument,
      src.OverallProcessingStatus as OverallProcessingStatus,
      src.DeliveryStatus as DeliveryStatus,
      src.BillingStatus as BillingStatus
}
