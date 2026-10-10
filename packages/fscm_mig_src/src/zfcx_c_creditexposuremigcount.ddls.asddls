// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CreditExposureMigCount as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFCX_V004N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CreditExposureMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFCX_C_CreditExposureMigCount
  as select from ZFCX_C_CreditExposureMig as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
      count( * ) as RecordCount
}
group by src.SourceSystem, src.SourceClient, src.ExportBatch
