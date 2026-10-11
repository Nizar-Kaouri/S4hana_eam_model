// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Language-dependent profit center name of the current or future validity interval; text provider for
//   ZCOV_B_ProfitCenter.
// Example: Profit center names in margin and cost reports.
// TODO-VERIFY[M] CO-T02: I_ProfitCenterText has ValidityEndDate in its key; one row per language after the filter (see CO-T01)
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Profit Center - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'ProfitCenter'
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZCOV_B_ProfitCenterText
  as select from I_ProfitCenterText
{
  key ControllingArea,
  key ProfitCenter,
      @Semantics.language: true
  key Language,
      @Semantics.text: true
      ProfitCenterName,
      @Semantics.text: true
      ProfitCenterLongName
}
where
  ValidityEndDate >= $session.system_date
