// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
  key cc.WorkCenterInternalID        as WorkCenterInternalID,
  key cc.ActivityTypeSet             as ActivityTypeSet,
  key cc.ValidityEndDate             as ValidityEndDate,
  key cc.CostCenterAssgmtCounter     as CostCenterAssgmtCounter,
      cc._WorkCenter.WorkCenter      as WorkCenter,
      cc._WorkCenter.Plant           as Plant,
      cc.ValidityStartDate           as ValidityStartDate,
      cc.ControllingArea             as ControllingArea,
      cc.CostCenter                  as CostCenter,
      cc._WorkCenter.IsMarkedForDeletion as IsMarkedForDeletion
}
