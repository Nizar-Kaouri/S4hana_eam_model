// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Language-dependent work center description (work center type 'A'); text provider for ZEAM_B_WorkCenter.
// Example: Show work center descriptions in backlog and operation reports.
// TODO-VERIFY[M] WC-T01: I_WorkCenterText exists, is released and has elements WorkCenterInternalID, WorkCenterTypeCode, Language, WorkCenterText
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Work Center - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'WorkCenterInternalID'
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #M,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEAM_B_WorkCenterText
  as select from I_WorkCenterText
{
  key WorkCenterInternalID,
      @Semantics.language: true
  key Language,
      @Semantics.text: true
      WorkCenterText
}
where
  WorkCenterTypeCode = 'A'
