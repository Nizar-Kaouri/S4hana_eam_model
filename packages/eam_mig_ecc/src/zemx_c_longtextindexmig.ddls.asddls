// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Long texts of EAM objects to migrate: the work list for the load program, which reads the content with READ_TEXT.
// Example: The load program loops over the rows of one TextObject and copies each text to the migrated object.
@AbapCatalog.sqlViewName: 'ZEMX_CLT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Long text index (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_LongTextIndexMig
  as select from ZEMX_I_LongTextHeader as src
{
      @EndUserText.label: 'Text Object'
  key src.TextObject as TextObject,
      @EndUserText.label: 'Text Name'
  key src.TextName   as TextName,
      @EndUserText.label: 'Text ID'
  key src.TextID     as TextID,
      @Semantics.language: true
      @EndUserText.label: 'Language'
  key src.Language   as Language
}
