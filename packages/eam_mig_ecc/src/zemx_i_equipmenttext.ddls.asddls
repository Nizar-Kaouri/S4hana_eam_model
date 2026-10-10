// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Equipment descriptions in every maintained language and the long-text indicator.
// Example: Extract the texts of the equipment in scope: join on Equipment with ZEMX_I_Equipment.
@AbapCatalog.sqlViewName: 'ZEMX_EQT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Equipment text (migration extract)'
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'Equipment'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_EquipmentText
  as select from eqkt
{
  key eqkt.equnr as Equipment,
      @Semantics.language: true
  key eqkt.spras as Language,
      @Semantics.text: true
      eqkt.eqktx as EquipmentName,
      eqkt.kzltx as HasLongText
}
