// ModuPorter EAM migration | Release 1.0.0
// Purpose: Work center descriptions with the business key (work center + plant) instead of the internal object ID.
// Example: Read all texts of work center MECH-01 in plant 1000.
@AbapCatalog.sqlViewName: 'ZEMX_WCT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Work center text'
@ObjectModel.representativeKey: 'WorkCenterInternalID'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #COMPOSITE
define view ZEMX_I_WorkCenterText
  as select from ZEMX_B_WorkCenterDesc as txt
{
      @EndUserText.label: 'Work Center Internal ID'
  key txt.WorkCenterInternalID       as WorkCenterInternalID,
      @Semantics.language: true
      @EndUserText.label: 'Language'
  key txt.Language                   as Language,
      @EndUserText.label: 'Work Center'
      txt._WorkCenter.WorkCenter     as WorkCenter,
      @EndUserText.label: 'Plant'
      txt._WorkCenter.Plant          as Plant,
      @Semantics.text: true
      @EndUserText.label: 'Work Center Text'
      txt.WorkCenterText             as WorkCenterText,
      @EndUserText.label: 'Is Marked For Deletion'
      txt._WorkCenter.IsMarkedForDeletion as IsMarkedForDeletion
}
