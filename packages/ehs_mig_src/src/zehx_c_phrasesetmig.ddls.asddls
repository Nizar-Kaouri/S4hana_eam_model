// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PhraseSetMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V009C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PhraseSetMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEHX_C_PhraseSetMig
  as select from ZEHX_I_PhraseSet as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.PhraseSetID as PhraseSetID,
  key src.PhraseCatalog as PhraseCatalog,
  key src.PhraseID as PhraseID,
      src.SortSequence as SortSequence
}
