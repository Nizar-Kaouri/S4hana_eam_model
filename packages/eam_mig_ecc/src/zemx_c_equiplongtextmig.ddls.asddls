// ModuPorter EAM migration | Release 1.0.0
// Purpose: Equipment child records in the same master scope; preserve their full keys.
// Example: Export the selected equipment population and retain Equipment as the parent key.
@AbapCatalog.sqlViewName: 'ZEMX_CEQLT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'EquipLongTextMig'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_EquipLongTextMig
  as select from ZEMX_I_EquipLongText as src
{
      @EndUserText.label: 'Equipment'
  key src.Equipment as Equipment,
      @EndUserText.label: 'Text Object'
  key src.TextObject as TextObject,
      @EndUserText.label: 'Text Name'
  key src.TextName as TextName,
      @EndUserText.label: 'Text ID'
  key src.TextID as TextID,
      @Semantics.language: true
      @EndUserText.label: 'Language'
  key src.Language as Language
}
