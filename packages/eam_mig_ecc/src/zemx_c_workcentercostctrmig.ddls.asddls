// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Cost center assignments of the work centers in scope with controlling area and cost center translated.
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
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'WORK_CENTER' and map01.SourceValue = src.WorkCenter
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'PLANT' and map02.SourceValue = src.Plant
    left outer join ZEMX_I_MigrationMap as map03 on map03.MapName = 'CONTROLLING_AREA' and map03.SourceValue = src.ControllingArea
    left outer join ZEMX_I_MigrationMap as map04 on map04.MapName = 'COST_CENTER' and map04.SourceValue = src.CostCenter
{
  key src.WorkCenter                 as LegacyWorkCenter,
  key src.Plant                      as LegacyPlant,
  key src.ValidityEndDate            as ValidityEndDate,
      coalesce( map01.TargetValue, src.WorkCenter ) as WorkCenter,
      coalesce( map02.TargetValue, src.Plant ) as Plant,
      src.ValidityStartDate          as ValidityStartDate,
      coalesce( map03.TargetValue, src.ControllingArea ) as ControllingArea,
      coalesce( map04.TargetValue, src.CostCenter ) as CostCenter
}
where src.IsMarkedForDeletion = ''
