// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Language-dependent cost center name and description of the validity interval that is current or in
//   the future; text provider for ZCOV_B_CostCenter.
// Example: Cost center names in cost reports.
// TODO-VERIFY[M] CO-T01: I_CostCenterText has ValidityEndDate in its key; the filter must leave one row per language (several future intervals would duplicate)
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Cost Center - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'CostCenter'
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZCOV_B_CostCenterText
  as select from I_CostCenterText
{
  key ControllingArea,
  key CostCenter,
      @Semantics.language: true
  key Language,
      @Semantics.text: true
      CostCenterName,
      @Semantics.text: true
      CostCenterDescription
}
where
  ValidityEndDate >= $session.system_date
