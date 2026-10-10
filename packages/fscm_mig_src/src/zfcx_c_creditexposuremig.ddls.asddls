// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CreditExposureMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFCX_V004C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CreditExposureMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFCX_C_CreditExposureMig
  as select from ZFCX_I_CreditExposure as src
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
