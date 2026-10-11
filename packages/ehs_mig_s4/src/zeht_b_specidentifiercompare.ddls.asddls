// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Native short identifier only; long-text interfaces and effective parent change-state relations remain pending.
// Purpose: Read SpecIdentifierCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] EHT-006: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SpecIdentifierCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZEHT_B_SpecIdentifierCompare
  as select from estri as src
{
  key src.recn as RecordNumber,
  key src.actn as ChangeState,
      src.valfr as ValidFrom,
      src.valto as ValidTo,
      src.delflg as DeletionFlag,
      src.recnroot as RootRecordNumber,
      src.idtype as IdentifierType,
      src.idcat as IdentifierCategory,
      src.langu as Language,
      src.ident as Identifier,
      src.ord as SortOrder
}
