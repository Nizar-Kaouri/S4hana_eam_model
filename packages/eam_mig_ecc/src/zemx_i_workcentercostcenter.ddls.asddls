// ModuPorter EAM migration | Release 1.0.0
// Purpose: Cost center assignments of work centers with the business key (work center + plant).
// Example: Find the work centers without a valid cost center.
@AbapCatalog.sqlViewName: 'ZEMX_WCK'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Work center cost center'
@ObjectModel.representativeKey: 'CostCenterAssgmtCounter'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #COMPOSITE
define view ZEMX_I_WorkCenterCostCenter
  as select from ZEMX_I_WorkCenterCostAssgmt as cc
{
      @EndUserText.label: 'Work Center Internal ID'
  key cc.WorkCenterInternalID        as WorkCenterInternalID,
      @EndUserText.label: 'Activity Type Set'
  key cc.ActivityTypeSet             as ActivityTypeSet,
      @EndUserText.label: 'Validity End Date'
  key cc.ValidityEndDate             as ValidityEndDate,
      @EndUserText.label: 'Cost Center Assgmt Counter'
  key cc.CostCenterAssgmtCounter     as CostCenterAssgmtCounter,
      @EndUserText.label: 'Work Center'
      cc._WorkCenter.WorkCenter      as WorkCenter,
      @EndUserText.label: 'Plant'
      cc._WorkCenter.Plant           as Plant,
      @EndUserText.label: 'Validity Start Date'
      cc.ValidityStartDate           as ValidityStartDate,
      @EndUserText.label: 'Controlling Area'
      cc.ControllingArea             as ControllingArea,
      @EndUserText.label: 'Cost Center'
      cc.CostCenter                  as CostCenter,
      @EndUserText.label: 'Is Marked For Deletion'
      cc._WorkCenter.IsMarkedForDeletion as IsMarkedForDeletion
}
