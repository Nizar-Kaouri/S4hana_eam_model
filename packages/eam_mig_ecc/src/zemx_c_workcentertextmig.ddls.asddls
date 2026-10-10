// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Work center descriptions per language for the work centers in scope with the business key (work center + plant).
// Example: Read the texts of work center MECH-01: filter WorkCenter = 'MECH-01'.
@AbapCatalog.sqlViewName: 'ZEMX_CWCT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Work center text (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_WorkCenterTextMig
  as select from ZEMX_I_WorkCenterText as src
{
  key src.WorkCenter     as WorkCenter,
  key src.Plant          as Plant,
      @Semantics.language: true
  key src.Language       as Language,
      @Semantics.text: true
      src.WorkCenterText as WorkCenterText
}
where src.IsMarkedForDeletion = ''
