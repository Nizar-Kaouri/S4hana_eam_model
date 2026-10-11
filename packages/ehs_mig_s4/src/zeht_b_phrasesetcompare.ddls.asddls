// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Phrase-set assignment records; not the complete phrase-set definition. Preserve native record and change-state keys.
// Purpose: Read PhraseSetCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] EHT-009: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PhraseSetCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZEHT_B_PhraseSetCompare
  as select from estpj as src
{
  key src.recn as RecordNumber,
  key src.actn as ChangeState,
      src.valfr as ValidFrom,
      src.valto as ValidTo,
      src.delflg as DeletionFlag,
      src.phrsel as PhraseSet,
      src.phrid as PhraseID,
      src.ord as SortOrder
}
