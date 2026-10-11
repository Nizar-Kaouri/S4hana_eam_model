// ModuPorter EAM migration | Release 1.0.0
// Purpose: Cost center assignments of the work centers in scope with controlling area and cost center.
// Example: Read the cost center assignments valid today: filter ValidityEndDate >= today.
@AbapCatalog.sqlViewName: 'ZEMX_CWCK'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Work center cost center (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_WorkCenterCostCtrMig
  as select from ZEMX_I_WorkCenterCostCenter as src
{
      @EndUserText.label: 'Work Center'
  key src.WorkCenter        as WorkCenter,
      @EndUserText.label: 'Plant'
  key src.Plant             as Plant,
      @EndUserText.label: 'Validity End Date'
  key src.ValidityEndDate   as ValidityEndDate,
      @EndUserText.label: 'Activity type set'
  key src.ActivityTypeSet as ActivityTypeSet,
      @EndUserText.label: 'Assignment counter'
  key src.CostCenterAssgmtCounter as CostCenterAssgmtCounter,
      @EndUserText.label: 'Validity Start Date'
      src.ValidityStartDate as ValidityStartDate,
      @EndUserText.label: 'Controlling Area'
      src.ControllingArea   as ControllingArea,
      @EndUserText.label: 'Cost Center'
      src.CostCenter        as CostCenter
}
where src.IsMarkedForDeletion = ''
