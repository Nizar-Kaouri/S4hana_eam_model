// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
    inner join ZEMX_I_Equipment as obj on obj.Equipment = src.Equipment
{
  key src.Equipment     as Equipment,
      @Semantics.language: true
  key src.Language      as Language,
      @Semantics.text: true
      src.EquipmentName as EquipmentName
}
where obj.IsMarkedForDeletion = ''
