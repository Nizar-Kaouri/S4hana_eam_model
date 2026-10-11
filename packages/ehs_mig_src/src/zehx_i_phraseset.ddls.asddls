// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Phrase-set assignment records; not the complete phrase-set definition. Preserve native record and change-state keys.
// Purpose: Read PhraseSet as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V009R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PhraseSet'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEHX_I_PhraseSet
  as select from ZEHX_B_PhraseSetData as src
{
  key src.RecordNumber as RecordNumber,
  key src.ChangeState as ChangeState,
      src.ValidFrom as ValidFrom,
      src.ValidTo as ValidTo,
      src.DeletionFlag as DeletionFlag,
      src.PhraseSet as PhraseSet,
      src.PhraseID as PhraseID,
      src.SortOrder as SortOrder
}
