// ModuPorter EAM migration | Release 1.0.0
// Purpose: Equipment descriptions (EQKT) per language with the long-text indicator.
// Example: Read the English description of equipment 10000001.
@AbapCatalog.sqlViewName: 'ZEMX_EQKT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Equipment description'
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'Equipment'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_B_EquipmentDesc
  as select from eqkt
{
      @EndUserText.label: 'Equipment'
  key eqkt.equnr as Equipment,
      @Semantics.language: true
      @EndUserText.label: 'Language'
  key eqkt.spras as Language,
      @Semantics.text: true
      @EndUserText.label: 'Equipment Name'
      eqkt.eqktx as EquipmentName,
      @EndUserText.label: 'Has Long Text'
      eqkt.kzltx as HasLongText
}
