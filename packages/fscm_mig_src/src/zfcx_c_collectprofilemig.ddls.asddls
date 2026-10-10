// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CollectProfileMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFCX_V005C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CollectProfileMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFCX_C_CollectProfileMig
  as select from ZFCX_I_CollectProfile as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.BusinessPartner as BusinessPartner,
      src.ProfileID as ProfileID,
      src.CompanyCode as CompanyCode,
      src.CollectionStrategy as CollectionStrategy
}
