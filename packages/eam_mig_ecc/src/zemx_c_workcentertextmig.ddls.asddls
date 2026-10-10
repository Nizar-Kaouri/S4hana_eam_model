// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Work center descriptions per language for the work centers in scope, business key translated.
// Example: Read the texts of work center MECH-01: filter LegacyWorkCenter = 'MECH-01'.
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
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'WORK_CENTER' and map01.SourceValue = src.WorkCenter
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'PLANT' and map02.SourceValue = src.Plant
{
  key src.WorkCenter                 as LegacyWorkCenter,
  key src.Plant                      as LegacyPlant,
  key src.Language                   as Language,
      coalesce( map01.TargetValue, src.WorkCenter ) as WorkCenter,
      coalesce( map02.TargetValue, src.Plant ) as Plant,
      @Semantics.text: true
      src.WorkCenterText             as WorkCenterText
}
where src.IsMarkedForDeletion = ''
