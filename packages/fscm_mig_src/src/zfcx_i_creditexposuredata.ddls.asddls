// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CreditExposureData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FCX-004: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFCX_V004'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CreditExposureData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFCX_I_CreditExposureData
  as select from zfcx_fcs004 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as BusinessPartner,
  key src.f005 as CreditSegment,
  key src.f006 as ExposureCategory,
  key src.f007 as SourceDocument,
  key src.f008 as SourceItem,
      src.f009 as ExposureAmount,
      src.f010 as Currency,
      src.f011 as AsOfUTC
}
