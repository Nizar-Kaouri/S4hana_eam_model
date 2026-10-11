// ModuPorter EAM migration | Release 1.0.0
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
      @EndUserText.label: 'Work Center'
  key src.WorkCenter     as WorkCenter,
      @EndUserText.label: 'Plant'
  key src.Plant          as Plant,
      @Semantics.language: true
      @EndUserText.label: 'Language'
  key src.Language       as Language,
      @Semantics.text: true
      @EndUserText.label: 'Work Center Text'
      src.WorkCenterText as WorkCenterText
}
where src.IsMarkedForDeletion = ''
