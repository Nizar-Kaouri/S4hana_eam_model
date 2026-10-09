// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// TODO-VERIFY[M] EQ-T01: I_EquipmentText exists and is released (C1) in S/4HANA 2025
// TODO-VERIFY[M] EQ-T02: I_EquipmentText element names Equipment / Language / EquipmentName
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Equipment - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'Equipment'
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEAM_I_EquipmentText
  as select from I_EquipmentText
{
  key Equipment,
      @Semantics.language: true
  key Language,
      @Semantics.text: true
      EquipmentName
}
