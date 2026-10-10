// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SalesHeaderStaData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] SDX-006: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZSDX_V006'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesHeaderStaData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZSDX_I_SalesHeaderStaData
  as select from vbuk as src
{
  key src.vbeln as SalesDocument,
      src.gbstk as OverallProcessingStatus,
      src.lfstk as DeliveryStatus,
      src.fkstk as BillingStatus
}
