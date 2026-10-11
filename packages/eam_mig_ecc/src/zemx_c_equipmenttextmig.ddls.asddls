// ModuPorter EAM migration | Release 1.0.0
// Purpose: Equipment descriptions by language in the equipment master scope.
// Example: Export the selected equipment population and retain Equipment as the parent key.
@AbapCatalog.sqlViewName: 'ZEMX_CEQT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Equipment text (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_EquipmentTextMig
  as select from ZEMX_I_EquipText as src
{
      @EndUserText.label: 'Equipment'
  key src.Equipment as Equipment,
      @Semantics.language: true
      @EndUserText.label: 'Language'
  key src.Language as Language,
      @Semantics.text: true
      @EndUserText.label: 'Equipment Name'
      src.EquipmentName as EquipmentName
}
