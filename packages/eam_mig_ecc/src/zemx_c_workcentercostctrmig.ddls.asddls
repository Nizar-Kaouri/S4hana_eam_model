// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
  key src.WorkCenter        as WorkCenter,
  key src.Plant             as Plant,
  key src.ValidityEndDate   as ValidityEndDate,
      src.ValidityStartDate as ValidityStartDate,
      src.ControllingArea   as ControllingArea,
      src.CostCenter        as CostCenter
}
where src.IsMarkedForDeletion = ''
