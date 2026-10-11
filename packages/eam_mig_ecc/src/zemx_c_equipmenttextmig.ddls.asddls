// ModuPorter EAM migration | Release 1.0.0
// Purpose: Descriptions of the equipment in scope per language.
// Example: Read the texts of equipment 10000001: filter Equipment = '000000000010000001'.
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
  as select from ZEMX_I_EquipmentDesc as src
  association [0..1] to ZEMX_I_Equipment as _Equipment on _Equipment.Equipment = $projection.Equipment
{
      @EndUserText.label: 'Equipment'
  key src.Equipment     as Equipment,
      @Semantics.language: true
      @EndUserText.label: 'Language'
  key src.Language      as Language,
      @Semantics.text: true
      @EndUserText.label: 'Equipment Name'
      src.EquipmentName as EquipmentName
}
where _Equipment.IsMarkedForDeletion = ''
