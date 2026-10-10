// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
  as select from ZEMX_I_WorkCenterDesc as txt
{
  key txt.WorkCenterInternalID       as WorkCenterInternalID,
      @Semantics.language: true
  key txt.Language                   as Language,
      txt._WorkCenter.WorkCenter     as WorkCenter,
      txt._WorkCenter.Plant          as Plant,
      @Semantics.text: true
      txt.WorkCenterText             as WorkCenterText,
      txt._WorkCenter.IsMarkedForDeletion as IsMarkedForDeletion
}
