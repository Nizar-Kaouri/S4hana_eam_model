// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
define view ZEMX_I_EquipmentDesc
  as select from eqkt
{
  key eqkt.equnr as Equipment,
      @Semantics.language: true
  key eqkt.spras as Language,
      @Semantics.text: true
      eqkt.eqktx as EquipmentName,
      eqkt.kzltx as HasLongText
}
