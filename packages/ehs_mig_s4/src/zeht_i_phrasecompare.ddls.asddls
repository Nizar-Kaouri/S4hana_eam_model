// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Phrase header only. ESTPP multilingual text and graphics are pending; no invented Language key on the header.
// Purpose: Read PhraseCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] EHT-008: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PhraseCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZEHT_I_PhraseCompare
  as select from estph as src
{
  key src.recn as RecordNumber,
  key src.actn as ChangeState,
      src.valfr as ValidFrom,
      src.valto as ValidTo,
      src.delflg as DeletionFlag,
      src.phrid as PhraseID,
      src.rem as Remark,
      src.srlangu as SourceLanguage,
      src.usexnam as UserDefinedName
}
