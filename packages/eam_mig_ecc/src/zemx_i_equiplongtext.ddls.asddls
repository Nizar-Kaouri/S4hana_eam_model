// ModuPorter EAM migration | Release 1.0.0
// Purpose: Equipment long text index linked to an existing non-deleted current equipment master.
// Example: Export the selected equipment population and retain Equipment as the parent key.
@AbapCatalog.sqlViewName: 'ZEMX_EQLTXT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Equipment long text index'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_EquipLongText
  as select from ZEMX_B_LongTextHeader as txt
    inner join ZEMX_I_Equipment as eq on eq.Equipment = txt.TextName
{
      @EndUserText.label: 'Equipment'
  key eq.Equipment as Equipment,
      @EndUserText.label: 'Text Object'
  key txt.TextObject as TextObject,
      @EndUserText.label: 'Text Name'
  key txt.TextName as TextName,
      @EndUserText.label: 'Text ID'
  key txt.TextID as TextID,
      @Semantics.language: true
      @EndUserText.label: 'Language'
  key txt.Language as Language
}
where eq.IsMarkedForDeletion = '' and txt.TextObject = 'EQUI'
