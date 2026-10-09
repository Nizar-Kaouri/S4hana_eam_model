// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// TODO-VERIFY[M] FL-T01: I_FunctionalLocationText exists and is released (C1) in S/4HANA 2025
// TODO-VERIFY[M] FL-T02: I_FunctionalLocationText element names FunctionalLocation / Language / FunctionalLocationName
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Functional Location - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'FunctionalLocation'
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEAM_I_FuncLocText
  as select from I_FunctionalLocationText
{
  key FunctionalLocation,
      @Semantics.language: true
  key Language,
      @Semantics.text: true
      FunctionalLocationName
}
