// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Native short identifier only; long-text interfaces and effective parent change-state relations remain pending.
// Purpose: Read SpecIdentifierMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V006C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SpecIdentifierMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEHX_C_SpecIdentifierMig
  as select from ZEHX_I_SpecIdentifier as src
{
  key src.RecordNumber as RecordNumber,
  key src.ChangeState as ChangeState,
      src.ValidFrom as ValidFrom,
      src.ValidTo as ValidTo,
      src.DeletionFlag as DeletionFlag,
      src.RootRecordNumber as RootRecordNumber,
      src.IdentifierType as IdentifierType,
      src.IdentifierCategory as IdentifierCategory,
      src.Language as Language,
      src.Identifier as Identifier,
      src.SortOrder as SortOrder
}
