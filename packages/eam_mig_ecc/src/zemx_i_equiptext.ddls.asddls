// ModuPorter EAM migration | Release 1.0.0
// Purpose: Equipment descriptions linked to an existing non-deleted current equipment master.
// Example: Export the selected equipment population and retain Equipment as the parent key.
@AbapCatalog.sqlViewName: 'ZEMX_EQTXT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Equipment descriptions'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_EquipText
  as select from ZEMX_B_EquipmentDesc as txt
    inner join ZEMX_I_Equipment as eq on eq.Equipment = txt.Equipment
{
      @EndUserText.label: 'Equipment'
  key eq.Equipment as Equipment,
      @Semantics.language: true
      @EndUserText.label: 'Language'
  key txt.Language as Language,
      @Semantics.text: true
      @EndUserText.label: 'Equipment Name'
      txt.EquipmentName as EquipmentName
}
where eq.IsMarkedForDeletion = ''
