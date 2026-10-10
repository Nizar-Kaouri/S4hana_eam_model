// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Phrase header only. ESTPP multilingual text and graphics are pending; no invented Language key on the header.
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
  key src.RecordNumber as RecordNumber,
  key src.ChangeState as ChangeState,
      src.ValidFrom as ValidFrom,
      src.ValidTo as ValidTo,
      src.DeletionFlag as DeletionFlag,
      src.PhraseID as PhraseID,
      src.Remark as Remark,
      src.SourceLanguage as SourceLanguage,
      src.UserDefinedName as UserDefinedName
}
