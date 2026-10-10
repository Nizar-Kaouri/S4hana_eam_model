// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read Phrase as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V008R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Phrase'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEHX_I_Phrase
  as select from ZEHX_I_PhraseData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.PhraseCatalog as PhraseCatalog,
  key src.PhraseID as PhraseID,
  key src.Language as Language,
      src.PhraseText as PhraseText,
      src.PhraseCode as PhraseCode
}
