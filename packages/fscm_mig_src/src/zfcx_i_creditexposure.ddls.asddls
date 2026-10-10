// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CreditExposure as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFCX_V004R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CreditExposure'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFCX_I_CreditExposure
  as select from ZFCX_I_CreditExposureData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.BusinessPartner as BusinessPartner,
  key src.CreditSegment as CreditSegment,
  key src.ExposureCategory as ExposureCategory,
  key src.SourceDocument as SourceDocument,
  key src.SourceItem as SourceItem,
      src.ExposureAmount as ExposureAmount,
      src.Currency as Currency,
      src.AsOfUTC as AsOfUTC
}
