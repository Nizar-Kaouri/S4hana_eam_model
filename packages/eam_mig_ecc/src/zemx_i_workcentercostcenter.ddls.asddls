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
    inner join ZEMX_I_WorkCenterHeader as wc on wc.WorkCenterInternalID = cc.WorkCenterInternalID
{
  key cc.WorkCenterInternalID    as WorkCenterInternalID,
  key cc.ActivityTypeSet         as ActivityTypeSet,
  key cc.ValidityEndDate         as ValidityEndDate,
  key cc.CostCenterAssgmtCounter as CostCenterAssgmtCounter,
      wc.WorkCenter              as WorkCenter,
      wc.Plant                   as Plant,
      cc.ValidityStartDate       as ValidityStartDate,
      cc.ControllingArea         as ControllingArea,
      cc.CostCenter              as CostCenter,
      wc.IsMarkedForDeletion     as IsMarkedForDeletion
}
